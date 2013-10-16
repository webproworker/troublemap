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
    @city = City.find(params[:id])
    # @city = City.find_by_permalink(params[:id])
  end

  def index
    @cities = City.all
  end

end
