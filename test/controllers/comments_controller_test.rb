require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = create(:valid_comment)    
  end

  test "should get index" do
    get post_comments_url(post_id: @comment.post_id), as: :json
    assert_response :success
  end

  test "should create comment" do
     assert_difference('Comment.count',1) do
      post post_comments_url(post_id: @comment.post_id), params: { data: { body: @comment.body, post_id: @comment.post_id, title: @comment.title, user_id: @comment.user_id } }, as: :json, headers: @auth_headers
     end
    # binding.pry
    assert_response 201
  end

  test "should show comment" do

    get post_comments_url(post_id: @comment.post_id, id: @comment.id), as: :json
    assert_response :success
  end

  test "should update comment" do    
    # skip
    patch post_comment_url(post_id: @comment.post_id, id: @comment.id), params: { data: { body: @comment.body, post_id: @comment.post_id, title: @comment.title, user_id: @comment.user_id } }, as: :json, headers: @auth_headers
    # binding.pry
    assert_response 200
  end

  test "should destroy comment" do
    # skip
    assert_difference('Comment.count', -1) do
      delete post_comment_url(post_id: @comment.post_id, id: @comment.id), as: :json, headers: @auth_headers
      # binding.pry
    end

    assert_response 204
  end
end
