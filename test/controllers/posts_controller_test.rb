require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = create(:valid_post) 
    @auth_headers = { 'Authorization' => "Basic #{Base64.encode64('user:secret')}" }   
  end

  test "should get index" do
    get posts_url, as: :json
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      # binding.pry
      post posts_url, params: { data: { body: @post.body, title: @post.title, user_id: @post.user_id } }, as: :json, headers: @auth_headers
    end
    assert_response 201
  end

  test "should show post" do 
    # binding.pry   
    get post_url(id: @post.id), as: :json
    assert_response :success

  end

  test "should update post" do    
    patch post_url(id: @post.id), params: { data: { body: @post.body, title: @post.title, user_id: @post.user_id } }, as: :json, headers: @auth_headers
    assert_response 200
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(id: @post.id), as: :json, headers: @auth_headers
    end
    assert_response 204
  end
end
