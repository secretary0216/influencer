class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :twitter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


# タグ
  acts_as_taggable

  def get_followers
    require 'twitter'
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        =  ENV["USER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["USER_CONSUMER_SECRET"]
      config.access_token        =  ENV["USER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["USER_ACCESS_TOKEN_SECRET"]
    end
    if client.user?(self.twitter_account)
      user = client.user(self.twitter_account)
      return user.followers_count
    else
      return "twitterアカウントが存在しません"
    end
  end

  def get_tweets
    require 'twitter'
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        =  ENV["USER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["USER_CONSUMER_SECRET"]
      config.access_token        =  ENV["USER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["USER_ACCESS_TOKEN_SECRET"]
    end
    if client.user?(self.twitter_account)
      user = client.user(self.twitter_account)
      return user.tweets_count
    else
      return "twitterアカウントが存在しません"
    end
  end


end
