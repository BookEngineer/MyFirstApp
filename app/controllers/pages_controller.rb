class PagesController < ApplicationController
  def home
    @reviews = Review.limit(10).order(created_at: :desc)
  end
end
