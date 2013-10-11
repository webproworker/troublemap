class TroublesController < ApplicationController

  # http_basic_authenticate_with name: "test", password: "parola", except: [:index, :show]

  def index
    @troubles = Trouble.all
  end

  def frontpage
    @jsonAll = Trouble.all.to_gmaps4rails do |trouble, marker|
      marker.infowindow render_to_string(:partial => "troubles/marker_infowindow", :locals => {:trouble => trouble})
      marker.title trouble.address
      marker.json({ :id => trouble.id, :foo => "bar" })
    end
  end

  def new
    @trouble = Trouble.new
  end
  
  def create
    @trouble = Trouble.new(params[:trouble].permit(:name, :city, :location, :description, :latitude, :longitude, :address))
    if @trouble.save
      redirect_to @trouble
    else
      render 'new'
    end
  end

  def show
    @trouble = Trouble.find(params[:id])
    @json = @trouble.to_gmaps4rails
  end

  def city
    @troubles = Trouble.all
    @city = Trouble.find(params[:id]).city
  end

  def edit
    @trouble = Trouble.find(params[:id])
  end

  def update
    @trouble = Trouble.find(params[:id])

    if @trouble.update(params[:trouble].permit(:name, :city, :location, :description, :latitude, :longitude, :address))
      redirect_to @trouble
    else
      render 'edit'
    end
  end

  def destroy
    @trouble = Trouble.find(params[:id])
    @trouble.destroy
    redirect_to troubles_path
  end

end
