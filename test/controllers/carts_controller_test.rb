require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carts_index_url
    assert_response :success
  end

  # test "the truth" do
  #   assert true
  # end
end
