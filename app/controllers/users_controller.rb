class UsersController < ApplicationController
  def mypage
    @user = current_user
    @reviews = @user.reviews
  end
end
