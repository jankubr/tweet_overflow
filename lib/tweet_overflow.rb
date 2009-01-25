require 'net/http'
require 'uri'
require 'cgi'

class TweetOverflow
  MORE_TEXT = ' ' unless defined?(MORE_TEXT)
  class << self
    def tweet(text, url, user, password, more_text = MORE_TEXT)
      self.new.tweet(text, url, user, password, more_text)
    end
  end

  def tweet(text, url, user, password, more_text)
    tweet, characters_from_text = create_tweet(text, url, more_text)    
    post_tweet(tweet, user, password)
    characters_from_text
  end
  
  def create_tweet(text, url, more_text)
    return [text, text.length] if text.length <= 140
    short_url = shorten_url(url)
    tweet_end = "#{more_text}#{short_url}"
    characters_from_text = 140 - tweet_end.length
    [text[0..characters_from_text-1] + tweet_end, characters_from_text]    
  end
  
  def shorten_url(url)
    http_request(:get, 'http://cli.gs', "/api/v1/cligs/create?url=#{CGI::escape(url)}")
  end
  
  def post_tweet(tweet, user, password)
    http_request(:post, 'http://twitter.com', "/statuses/update.json?status=#{CGI::escape(tweet)}", user, password)    
  end
  
  def http_request(method, uri, path, user = nil, password = nil)
    uri = URI.parse(uri)
    res = Net::HTTP.start(uri.host, uri.port) {|http|
      if method == :post
        request = Net::HTTP::Post.new(path)  
      else
        request = Net::HTTP::Get.new(path)
      end      
      request.basic_auth(user, password) if user    
      response = http.request(request)    
      case response
        when Net::HTTPSuccess 
          return response.body
        else
          response.error!
      end
    }
  end
  
end