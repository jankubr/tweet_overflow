$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('tweet_overflow', '0.1.0') do |p|
  p.description    = "Publishes your tweet with a link to content that didn't fit"
  p.url            = "http://github.com/jankubr/tweet_overflow"
  p.author         = "Jan Kubr"
  p.email          = "jan.kubr@gmail.com"
  p.ignore_pattern = []
  p.runtime_dependencies = []
  p.development_dependencies = ['rspec', 'mocha']
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }


require 'cucumber/rake/task'
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format pretty"
end

