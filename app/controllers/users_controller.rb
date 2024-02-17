class UsersController < ApplicationController
  def mypage
    @user = current_user
    @reviews = @user.reviews
  end

  def review_detail
    @review = Review.find(params[:review_id])
  end



end
