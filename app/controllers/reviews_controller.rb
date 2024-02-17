class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @review = Review.new
    @book_title = params[:review][:book_title]
    @book_author = params[:review][:book_author]
    @book_image_url = params[:review][:book_image_url]
    @reviewer = current_user.name
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to root_path, notice: "レビューが作成されました"
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end


  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to root_path, notice: "レビューが削除されました"
  end

  def edit
    @review = Review.find(params[:id])
  end
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to root_path, notice: "レビューが更新されました"
    else
      render :edit
    end
  end



  private

  def review_params
    params.require(:review).permit(:book_title, :book_author, :rating, :read_date, :content, :book_image_url, :reviewer, :user_id)
  end
end
