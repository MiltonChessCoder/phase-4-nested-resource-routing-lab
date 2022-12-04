class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :user_not_found

  def index 
    users = User.all 
    render json: users 
  end 

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items, status: :ok 
  end

  private 

  def user_not_found 
    render json: { error: "User not found "}, status: :not_found
  end 

end