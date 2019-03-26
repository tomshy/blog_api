require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
  	@comment=build(:valid_comment)
  	@comment.user_id=User.last.id
  	@comment.post_id=Post.last.id
  end

  test 'comment is valid' do  
  	# binding.pry	
  	assert @comment.valid?
  end
  test 'comment is not valid without required fields' do
  	@invalid_comment=build(:comment)
  	refute @invalid_comment.valid?  	
  end
  test 'correct error message output for an invalid comment without title' do
  	@comment.title=nil
  	 # binding.pry
  	refute @comment.valid?  	
  	refute_empty @comment.errors[:title]
  end
  test 'correct error message output for an invalid comment without body' do
  	@comment.body=nil
  	refute @comment.valid?
  	refute_empty @comment.errors[:body]
  end
end
