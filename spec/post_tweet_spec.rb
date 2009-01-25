$:.unshift(File.join(File.dirname(__FILE__)))
require 'spec_helper'

describe  "Tweet posting" do
    
  it "should shorten a ULR using cli.gs API" do  
    #should start request
    http = stub
    Net::HTTP.expects(:start).yields(http)    
    #response should be success
    response = Net::HTTPSuccess.new('', '', '')
    response.expects(:body).returns(short_url)
    http.expects(:request).returns(response)
    #should be GET with no authentication
    request = stub
    Net::HTTP::Get.expects(:new).returns(request)
    request.expects(:basic_auth).never
    
    TweetOverflow.new.shorten_url('http://jankubr.com/long?more=1&not_enough=3').should == short_url
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