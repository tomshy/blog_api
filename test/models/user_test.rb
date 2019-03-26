require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user=build(:valid_user)
  end

  test 'user is valid' do  	
  	assert @user.valid?
  end
  test 'user is not valid without required fields' do
  	@invalid_user=build(:user)
  	refute @invalid_user.valid?
  end
  test 'correct error message output for an invalid user without email' do
  	@user.email=nil
  	refute @user.valid?
  	#binding.pry
  	refute_empty @user.errors[:email]
  end
  test 'correct error message output for an invalid user without username' do
  	@user.username=nil
  	refute @user.valid?
  	refute_empty @user.errors[:username]
  end
  test 'correct error message output for an invalid user without password' do
  	@user.password=nil
  	refute @user.valid?
  	#binding.pry
  	refute_empty @user.errors[:password]
  end
end
