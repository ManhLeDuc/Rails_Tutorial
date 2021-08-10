class FollowingsController < ApplicationController
  before_action :logged_in_user, :load_user

  def index
    @title = t "following"
    @users = @user.following.page(params[:page]).per Settings.big_page_size
    render "users/show_follow"
  end
end
