class TroublesController < ApplicationController

  http_basic_authenticate_with name: "test", password: "parola", except: [:index, :show]

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

  def edit
    @trouble = Trouble.find(params[:id])
  end

  def update
    @trouble = Trouble.find(params[:id])

    if @trouble.update(params[:trouble].permit(:name, :location, :description))
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
