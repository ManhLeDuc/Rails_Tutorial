class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      login user, params[:session][:remember_me] == "1"
    else
      flash.now[:danger] = t ".fail"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def login user, remember_me
    log_in user
    remember_me ? remember(user) : forget(user)
    redirect_to user
  end
end
