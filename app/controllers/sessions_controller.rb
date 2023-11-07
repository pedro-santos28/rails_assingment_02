class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in"
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid credentials"
      render :new , status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
