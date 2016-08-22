require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "should get set_up" do
    get :set_up
    assert_response :success
  end

end
