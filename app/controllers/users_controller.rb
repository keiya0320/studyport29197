class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @posts = current_user.posts.all.order(created_at: :desc)
  end
end
