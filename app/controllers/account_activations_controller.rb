class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if check_activatable user
      user.activate
      log_in user
      flash[:success] = t ".activate_success"
      redirect_to user
    else
      flash[:danger] = t ".activate_fail"
      redirect_to root_url
    end
  end

  private
  def check_activatable user
    user && !user.activated && user.authenticated?(:activation, params[:id])
  end
end
