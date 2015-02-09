class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_parmas)
    if @location.save
      redirect_to @location, notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
      redirect_to @location, notice: 'Location was successfully updated.'
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path, alert: 'Location was successfully destroyed.'
  end


  private
  def location_parmas
    params.require(:location).permit(:name, :address, :zip_code)
  end

end
