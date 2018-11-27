class NotificationsController < ApplicationController
  before_action :notification_params

  def index
    @notifications = Notification.all
    render :index
  end

  def create
  binding.pry
  @notification = Notification.new
  @hackathon = Hackathon.find(params[:hackathon_id])
  @hackathon.notifications << @notification
    if @notification.save
      render json: { message: "notification stored"}
    else
      render json: { message: "something went wrong"}
    end
  end

  def destroy
    @notification = notification.find(params[:id])
    if @notification.destroy
      render json: { message: "notification destroyed"}
    else
      render json: { message: "something went wrong"}
    end
  end

  def destroy_all
    if Notification.destroy_all
      render json: { message: "all notifications destroyed"}
    else
      render json: { message: "something went wrong"}
    end
  end

  def notification_params
    params.permit!
  end
end
