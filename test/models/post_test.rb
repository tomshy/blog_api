require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@post=build(:valid_post)
  	@post.user_id=User.last.id
  end

  test 'post is valid' do  
  	# binding.pry	
  	assert @post.valid?
  end
  test 'post is not valid without required fields' do
  	@invalid_post=build(:post)
  	refute @invalid_post.valid?  	
  end
  test 'correct error message output for an invalid post without title' do
  	@post.title=nil
  	 # binding.pry
  	refute @post.valid?  	
  	refute_empty @post.errors[:title]
  end
  test 'correct error message output for an invalid post without body' do
  	@post.body=nil
  	refute @post.valid?
  	refute_empty @post.errors[:body]
  end  
end
