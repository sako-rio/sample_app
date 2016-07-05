class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_paramus)

    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end

  end

  private

    def user_paramus
      params.require(:user).permit(:name, :email, :password,
                       :password_confirmation)
    end

end
