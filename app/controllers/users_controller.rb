class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :back, :notice => "Contul a fost inregistrat cu succes!"
    else
      render "new"
    end  
  end

  def show
    @user = User.find(params[:id])
    @identity = Identity.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(params[:user].permit(:name, :mod))
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.fetch(:user).permit(:email, :password, :password_confirmation) if params[:user]
    end

end
