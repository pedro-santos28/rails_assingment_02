class RegistrationsController < ApplicationController
  def new
    @user = User.find_by(id: session[:user_id])
    if @user
      redirect_to root_path
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        flash[:notice] = "Successfully created account, now log-in."
        redirect_to sessions_path
    else
      flash.now[:alert] = "Unable to create account"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
