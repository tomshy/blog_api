require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest  
  setup do    
    @user=build_stubbed(:valid_user) 

  end

  test "should get index" do          
    get users_url, as: :json
    assert_response :success
  end 
 
  test "should create user" do 
    assert_difference('User.count') do
      post users_url, params: { data: { email: @user.email, full_name: @user.full_name, password: @user.password, username: @user.username } }, as: :json      
    end    
    assert_response 201
  end
  
  test 'should not create an invalid user' do
    @invalid_user=build(:user)
    assert_no_difference('User.count') do
      post users_url, params: { data: { full_name: @invalid_user.full_name, username: @invalid_user.username, email: @invalid_user.email, password: @invalid_user.password } }, as: :json
    end
    assert_response 400, "Ensure no required key is empty"
  end
end
