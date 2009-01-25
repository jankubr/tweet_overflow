$:.unshift(File.join(File.dirname(__FILE__)))
require 'spec_helper'

describe TweetOverflow do

  it "should post the tweet to Twitter as is if shorter than 140 characters" do
    short_tweet = "very short tweet"
    TweetOverflow.any_instance.expects(:post_tweet).with do |tweet, passed_user, passed_password|
      tweet.should == short_tweet
    end
    TweetOverflow.tweet(short_tweet, url, user, password).should == short_tweet.length
  end
  
  it "should shorten tweets longer than 140 characters" do
    TweetOverflow.any_instance.expects(:shorten_url).with(url).returns(short_url)
    TweetOverflow.any_instance.expects(:post_tweet)
    TweetOverflow.tweet(long_tweet, url, user, password).should == 140 - short_url.length - TweetOverflow::MORE_TEXT.length
  end
  
  it "should append a URL to the full content to tweets longer than 140 characters" do
    TweetOverflow.any_instance.expects(:shorten_url).with(url).returns(short_url)
    TweetOverflow.any_instance.expects(:post_tweet).with do |tweet, passed_user, passed_password|
      tweet.should =~ Regexp.new("#{short_url}$")
      passed_user.should == user
      passed_password.should == password
    end
    TweetOverflow.tweet(long_tweet, url, user, password).should == 140 - short_url.length - TweetOverflow::MORE_TEXT.length
  end

  it "should prefix the full content URL with the given string" do
    TweetOverflow.any_instance.expects(:shorten_url).with(url).returns(short_url)
    TweetOverflow.any_instance.expects(:post_tweet).with do |tweet, passed_user, passed_password|
      tweet.should =~ Regexp.new(" Více: #{short_url}$")
    end
    TweetOverflow.tweet(long_tweet, url, user, password, ' Více: ').should == 140 - short_url.length - ' Více: '.length
  end
  
  def long_tweet
    'bla ' * 36    
  end
  
  def url
    'http://blog.com?p=1'
  end
  
  def short_url
    'http://cli.gs/12345'
  end
  
  def user
    'user'
  end
  
  def password
    'password'
  end
end