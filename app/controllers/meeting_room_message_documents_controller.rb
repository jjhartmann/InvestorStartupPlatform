class MeetingRoomMessageDocumentsController < ApplicationController
  before_action :set_meeting_room_message_document, only: [:show, :edit, :update, :destroy]

  # GET /meeting_room_message_documents
  # GET /meeting_room_message_documents.json
  def index
    @meeting_room_message_documents = MeetingRoomMessageDocument.all
  end

  # GET /meeting_room_message_documents/1
  # GET /meeting_room_message_documents/1.json
  def show
  end

  # GET /meeting_room_message_documents/new
  def new
    @meeting_room_message_document = MeetingRoomMessageDocument.new
  end

  # GET /meeting_room_message_documents/1/edit
  def edit
  end

  # POST /meeting_room_message_documents
  # POST /meeting_room_message_documents.json
  def create
    @meeting_room_message_document = MeetingRoomMessageDocument.new(meeting_room_message_document_params)

    respond_to do |format|
      if @meeting_room_message_document.save
        format.html { redirect_to @meeting_room_message_document, notice: 'Meeting room message document was successfully created.' }
        format.json { render :show, status: :created, location: @meeting_room_message_document }
      else
        format.html { render :new }
        format.json { render json: @meeting_room_message_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meeting_room_message_documents/1
  # PATCH/PUT /meeting_room_message_documents/1.json
  def update
    respond_to do |format|
      if @meeting_room_message_document.update(meeting_room_message_document_params)
        format.html { redirect_to @meeting_room_message_document, notice: 'Meeting room message document was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_room_message_document }
      else
        format.html { render :edit }
        format.json { render json: @meeting_room_message_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_room_message_documents/1
  # DELETE /meeting_room_message_documents/1.json
  def destroy
    @meeting_room_message_document.destroy
    respond_to do |format|
      format.html { redirect_to meeting_room_message_documents_url, notice: 'Meeting room message document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_room_message_document
      @meeting_room_message_document = MeetingRoomMessageDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_room_message_document_params
      params.require(:meeting_room_message_document).permit(:meeting_room_message_id)
    end
end
