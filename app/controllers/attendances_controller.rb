class AttendancesController < ApplicationController

  def new
    @event = Event.find_by(id: params[:event_id])
    @attendance = Attendance.new
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def create
    @attendance = Attendance.new(stripe_customer_id: "########", event_id: params[:event_id], user_id: params[:id])
    if @attendance.save 
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid attendance parameters !'
      render 'new'
    end
  end

end
