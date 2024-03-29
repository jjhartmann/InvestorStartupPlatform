class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy, :dismiss]
  skip_before_action :verify_authenticity_token, only: [:dismiss]

  layout 'frontpage'
  before_filter :authenticate_user!

  # GET /notifications
  # GET /notifications.json
  def index
    @title_heading = "Notifications"
    @notifications_paged = @notifications.paginate(page: params[:page], per_page: 10)
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #dismiss a notification
  def dismiss
    @notification.update(is_viewed: true)


  end

  def dismiss_all
    puts "VIEWING ALL NOTES"
    for note in @notifications
      note.update(is_viewed: true)
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification

      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:notificable_id, :notificable_type, :notification_text, :is_viewed, :notification_type)
    end
end
