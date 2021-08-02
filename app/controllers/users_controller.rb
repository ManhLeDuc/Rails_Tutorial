class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "welcome"
      redirect_to @user
    else
      flash[:danger] = t ".sign_up_fail"
      render :new
    end
  end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit User::USER_ATTRS
  end
end
