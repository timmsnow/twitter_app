class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render "index.json.jb"
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
    render "show.json.jb"
  end

  def create
    @user = User.new(
      username: params[:username],
    )

    #Happy/Sad Path
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def update
    user_id = params[:id]
    @user = User.find(product_id)

    @user.username = params[:username] || @user.username

    #Happy/Sad Path
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def destroy
    user_id = params[:id]
    user = User.find(user_id)
    tweet.destroy
    render json: { message: "YOU DELETED THE TWEET" }
  end
end
