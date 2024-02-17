require "test_helper"

class SearchBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get search_books_search_url
    assert_response :success
  end
end
