class CitiesController < ApplicationController

  def new
    @city = City.new
  end
  
  def create
    @city = City.new(params[:city].permit(:name))
    if @city.save
      redirect_to @city
    else
      render 'new'
    end
  end

  def show
    @city = City.find_by_param(params[:id])
    @troubles = Trouble.where(city_id: @city.id)
    @json = @troubles.to_gmaps4rails
  end

  def index
    @cities = City.all
  end

end
