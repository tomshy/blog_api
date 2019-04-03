class UsersController < ApplicationController
  before_action :set_user, only: :show

  # GET /users
  def index
    @users = User.all
    render json: @users
  end
  def create
    @user = User.new(user_params)    
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: 400
    end
  end     
  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:data).permit(:full_name, :username, :email, :password)
    end
end
