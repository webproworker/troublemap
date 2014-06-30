class UsersController < ApplicationController
  
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

  private
    def user_params
      params.fetch(:user).permit(:email, :password, :password_confirmation) if params[:user]
    end

end
