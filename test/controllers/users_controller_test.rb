require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do    
    @user=build_stubbed(:valid_user) 
  end

  test "should get index" do      
    get users_url, as: :json
    assert_response :success
  end 
 
  test "should create user" do 
    assert_difference('User.count') do
      post user_registration_url, params: { user: { email: @user.email, name: @user.name, password: @user.password, username: @user.username } }, as: :json            
    end    
    assert_response 201
  end
  
  test 'should not create an invalid user' do
    @invalid_user=build(:user)
    assert_no_difference('User.count') do
      post user_registration_url, params: { user: { email: @invalid_user.email, name: @invalid_user.name, password: @invalid_user.password, username: @invalid_user.username } }, as: :json
    end
    assert_response 406, "Ensure no required key is empty"
  end
  
  test "should show user" do
    @user=create(:valid_user)
    get user_url(@user), as: :json
    assert_response :success 
  end
  
  test "should update user" do
    sign_in @user    
    patch user_registration_url, params: { user: { name: @user.name } }, as: :json    
    assert_response 200
  end
end
