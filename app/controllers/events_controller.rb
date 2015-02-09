class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @location = Location.find(params[:location_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.location_id = params[:location_id]
    @location = Location.find(params[:location_id])
    if @event.save
      redirect_to location_event_path(@location,@event)
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:location_id])
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    @location = Location.find(params[:location_id])
      redirect_to location_event_path, notice: 'Event was successfully updated.'
  end

  def destroy
    @location = Location.find(params[:location_id])
    @event = @location.events.find(params[:id])
    @event.destroy
    redirect_to locations_path, alert: 'Event was successfully destroyed.'
  end


  private

  def location_params
    params.require(:location).permit(:name, :address, :zip_code)
  end

  def event_params
    params.require(:event).permit(:description, :date, :requires_id)
  end
end
