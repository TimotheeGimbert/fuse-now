class EventsController < ApplicationController

  def index

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(title: params[:title], start_date: params[:start_date], duration: params[:duration], location: params[:location], price: params[:price], description: params[:description], administrator_id: current_user.id)
    if @event.save 
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid event parameters !'
      render 'new'
    end
  end
  
  def show
    @event = Event.find_by(id: params[:id])
  end

end
