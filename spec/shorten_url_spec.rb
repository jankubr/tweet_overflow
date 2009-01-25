$:.unshift(File.join(File.dirname(__FILE__)))
require 'spec_helper'

describe  "URL shortening" do
    
  it "should post a tweet using Twitter API" do  
    #should start request
    http = stub
    Net::HTTP.expects(:start).yields(http)    
    #response should be success
    response = Net::HTTPSuccess.new('', '', '')
    response.expects(:body).returns('anything')
    http.expects(:request).returns(response)
    #should do basic HTTP authorization
    request = stub
    Net::HTTP::Post.expects(:new).returns(request)
    request.expects(:basic_auth).with(user, password)
    
    TweetOverflow.new.post_tweet('tweet', user, password)    
  end
  
  def user
    'user'
  end
  
  def password
    'password'
  end
end