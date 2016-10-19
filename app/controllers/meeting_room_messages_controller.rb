class MeetingRoomMessagesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  before_action :set_meeting_room_message, only: [:show, :edit, :update, :destroy]

  def index
    @meeting_room_messages = MeetingRoomMessage.all
  end

  def show
  end

  def new
    @meeting_room_message = MeetingRoomMessage.new
  end

  def edit
  end

  def create
    @meeting_room_message = MeetingRoomMessage.new(meeting_room_message_params)

    respond_to do |format|
      if @meeting_room_message.save
        format.html { redirect_to @meeting_room_message, notice: 'Meeting room message was successfully created.' }
        format.json { render :show, status: :created, location: @meeting_room_message }
      else
        format.html { render :new }
        format.json { render json: @meeting_room_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meeting_room_message.update(meeting_room_message_params)
        format.html { redirect_to @meeting_room_message, notice: 'Meeting room message was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_room_message }
      else
        format.html { render :edit }
        format.json { render json: @meeting_room_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meeting_room_message.destroy
    respond_to do |format|
      format.html { redirect_to meeting_room_messages_url, notice: 'Meeting room message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def chatroom
    @member = @user.profilable.meeting_room_members.find_by(meeting_room_id: params[:meeting_room_id])
    if @member.present?
    else
      @member = @user.profilable.meeting_room_members.create(meeting_room_id: params[:meeting_room_id])
    end
    @meeting_room = @member.meeting_room
    @messages = @meeting_room.meeting_room_messages
    @members = @meeting_room.meeting_room_members
    @message = Message.new()
  end

  def send_message
    message = @user.messages.new(message_params)
    if message.save
      @message = message
      @member = @user.profilable.meeting_room_members.find_by(meeting_room_id: params[:message][:meeting_room_id])
      @meeting_room = @member.meeting_room
      @meeting_room_message = @meeting_room.meeting_room_messages.new(message_id: @message.id, meeting_room_member_id: @member.id)
      if @meeting_room_message.save
        ActionCable.server.broadcast 'messages',
          message: @message.content,
          user: @message.user.name,
          created_at: @message.created_time,
          user_id:  @message.user.id,
          image: @message.user.photo? ? @message.user.photo_avatar.url : '/assets/user_50.jpeg'
        head :ok
      else
        respond_to do |format|
          flash[:notice] = "There was some error in sending the message."
          format.html { redirect_to meeting_room_path(params[:message][:meeting_room_id]) }
          format.js { render template: 'messages/error.js.erb'}
        end
      end
    else
      respond_to do |format|
        flash[:notice] = message.errors
        format.js { render template: 'messages/error.js.erb'}
        format.html { redirect_to meeting_room_path(params[:message][:meeting_room_id]) }
      end
    end
  end

  def send_document
    @message = Message.create(content: "#{@user.name} has sent a document", user_id: @user.id)
    @meeting_room = @user.profilable.meeting_rooms.find_by(params[:meeting_room_id])
    if @meeting_room.present?
      @member = @meeting_room.meeting_room_members.find_by(meetable: @user.profilable)
      if @member.present?
        @meeting_room_message = @meeting_room.meeting_room_messages.create(message_id: @message.id, meeting_room_member_id: @member.id)
        puts @meeting_room_message
        @document =  MeetingRoomMessageDocument.new(meeting_room_message_document_params.merge(meeting_room_message_id: @meeting_room_message.id))
        if @document.save
          ActionCable.server.broadcast 'messages',
            message: @message.content,
            user: @message.user.name,
            created_at: @message.created_time,
            user_id:  @message.user.id,
            image: @message.user.photo? ? @message.user.photo_avatar.url : '/assets/user_50.jpeg',
            document: @document.document.url,
            document_id: @document.id
          redirect_to meeting_room_path(id: @meeting_room.id), notice: "Document Sent successfully"
        else
          @meeting_room_message.destroy
          @message.destroy
          respond_to do |format|
            format.html {redirect_to :back, alert: "Make sure that you uploaded a document of type .jpg, .jpeg, .png, .doc, .docx, .pdf, .xlsx, .xls" }
          end
        end
      else
        @message.destroy
        respond_to do |format|
          format.html {redirect_to :back, alert: "You are not a member of this meeting." }
        end
        p "error; member not present"
      end
    else
      @message.destroy
      respond_to do |format|
        format.html {redirect_to :back, alert: "No such meeting exists." }
      end
      p "error; no such meeting room"
    end
  end

  def view_document
    @document = MeetingRoomMessageDocument.find_by(id: params[:id])
    #This will decrpyt the file first

    Carrierwave::EncrypterDecrypter::Downloader.decrypt(@document,mounted_as: :document)

    file_path = @document.document.path
      File.open(file_path, 'r') do |f|
        send_data f.read, type: MIME::Types.type_for(file_path).first.content_type,disposition: :inline,:filename => File.basename(file_path)
    end
      #This is to remove the decrypted file after transfer
      File.unlink(file_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_room_message
      @meeting_room_message = MeetingRoomMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_room_message_params
      params.require(:meeting_room_message).permit(:meeting_room_id, :meeting_member_id, :message_id)
    end

    def message_params
      params.require(:message).permit(:content)
    end

    def meeting_room_message_document_params
      params.require(:meeting_room_message_document).permit(:document)
    end
end
