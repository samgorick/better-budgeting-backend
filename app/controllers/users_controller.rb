class UsersController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user
      render json: { error: 'Email address already exists. Try logging in instead' }
    else
      user = User.create!({email: params[:email], password: params[:password]})

      render json: user, include: [:transactions, :budgets, :savings]
    end
  end

  def login 
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user, include: [:transactions, :budgets, :savings]
    else
      render json: { error: 'Invalid username or password'}
    end
  end

  def index
    users = User.all 
    render json: users, include: [:transactions, :budgets, :savings]
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end