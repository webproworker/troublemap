class TroublesController < ApplicationController

  def index
    @troubles = Trouble.all
  end

  def new
    @trouble = Trouble.new
  end
  
  def create
    @trouble = Trouble.new(params[:trouble].permit(:name, :location, :description))
    if @trouble.save
      redirect_to @trouble
    else
      render 'new'
    end
  end

  def show
    @trouble = Trouble.find(params[:id])
  end

end
