class SearchBooksController < ApplicationController
  require 'net/http'
  require 'json'

  def search
    if params[:query].present?
      @query = params[:query]
      url = URI("https://www.googleapis.com/books/v1/volumes?q=#{URI.encode_www_form_component(@query)}")
      response = Net::HTTP.get(url)
      @results = JSON.parse(response)
    end
  end
end
