class TroublesController < ApplicationController

  # http_basic_authenticate_with name: "test", password: "parola", except: [:index, :show]

  # before_action :authenticate, only: [:show, :frontpage]

  # def authenticate
  #   redirect_to(new_identity_path) unless @current_user
  # end

  def index
    @troubles = Trouble.all
    @jsonAll = Trouble.all.to_gmaps4rails do |trouble, marker|
      marker.infowindow render_to_string(:partial => "troubles/marker_infowindow", :locals => {:trouble => trouble})
      marker.title trouble.address
      marker.json({ :id => trouble.id, :foo => "bar" })
    end
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
    @json = @trouble.to_gmaps4rails
  end
  
  def create
    @trouble = Trouble.new(params[:trouble].permit(:name, :description, :latitude, :longitude, :address, :city_id, :author, :severity, :photo))
    if @trouble.save
      # LeaderMailer.complaint(@trouble).deliver
      redirect_to @trouble
    else
      render 'new'
    end
  end

  def show
    @trouble = Trouble.find(params[:id])
    @json = @trouble.to_gmaps4rails do |trouble, marker|
      marker.infowindow render_to_string(:partial => "troubles/single_marker_infowindow", :locals => {:trouble => trouble})
      marker.title trouble.address
      marker.json({ :id => trouble.id, :foo => "bar" })
    end
  end

  def edit
    @trouble = Trouble.find(params[:id])
    @json = @trouble.to_gmaps4rails
  end

  def update
    @trouble = Trouble.find(params[:id])

    if @trouble.update(params[:trouble].permit(:name, :description, :latitude, :longitude, :address, :city_id, :photo))
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
