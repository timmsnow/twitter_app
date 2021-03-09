class Api::TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    render "index.json.jb"
  end

  def show
    tweet_id = params[:id]
    @tweet = Tweet.find(tweet_id)
    render "show.json.jb"
  end

  def create
    @tweet = Tweet.new(
      user_id: params[:user_id],
      text: params[:text],
    )

    #Happy/Sad Path
    if @tweet.save
      render "show.json.jb"
    else
      render json: { errors: @tweet.errors.full_messages }, status: 400
    end
  end

  def update
    tweet_id = params[:id]
    @tweet = Tweet.find(tweet_id)

    @tweet.user_id = params[:user_id] || @tweet.user_id
    @tweet.text = params[:text] || @tweet.text

    #Happy/Sad Path
    if @tweet.save
      render "show.json.jb"
    else
      render json: { errors: @tweet.errors.full_messages }, status: 400
    end
  end

  def destroy
    tweet_id = params[:id]
    tweet = Tweet.find(tweet_id)
    tweet.destroy
    render json: { message: "YOU DELETED THE TWEET" }
  end
end
