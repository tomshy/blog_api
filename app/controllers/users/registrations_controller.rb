# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def index
    @users = User.all

    render json: @users
  end
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: 406
    end
  end  
  def update
    @user=current_user 
    render json: @user
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :username, :email, :password)
    end
end
