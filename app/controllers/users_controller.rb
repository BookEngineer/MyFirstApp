class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :review_detail]
  before_action :correct_user, only: [:review_detail]

  def mypage
    @user = current_user
    @reviews = @user.reviews
  end

  def review_detail
    @review = Review.find(params[:review_id])
  end

  private

  def correct_user
    @review = current_user.reviews.find_by(id: params[:review_id])
    redirect_to root_path, alert: "権限がありません" if @review.nil?
  end
end
