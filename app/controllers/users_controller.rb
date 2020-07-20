class UsersController < ApplicationController

  def create
    user = User.find_by(email: user_params[:email])
    if user
      render json: { error: 'Email address already exists. Try logging in instead' }
    else
      user = User.create!(user_params)

      render json: user, include: [:transactions, :budgets, :savings]
    end
  end

  def login 
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      render json: user, include: [:transactions, :budgets, :savings]
    else
      render json: { error: 'Invalid username or password'}
    end
  end

  def show
    token = request.headers['Authorization'].split(' ').last
    decoded_token = JWT.decode(token, 's3cret!', true, { algorithm: 'HS256' })
    id = decoded_token.first['user_id']

    user = User.find(id)
    if user
      render json: user, include: [:transactions, :budgets, :savings]
    else
      render json: [ error: 'Please log in']
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