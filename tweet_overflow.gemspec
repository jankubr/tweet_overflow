# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tweet_overflow}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jan Kubr"]
  s.date = %q{2009-01-25}
  s.description = %q{Publishes your tweet with a link to content that didn't fit}
  s.email = %q{jan.kubr@gmail.com}
  s.extra_rdoc_files = ["lib/tweet_overflow.rb", "README.rdoc"]
  s.files = ["lib/tweet_overflow.rb", "Manifest", "Rakefile", "README.rdoc", "spec/post_tweet_spec.rb", "spec/shorten_url_spec.rb", "spec/spec_helper.rb", "spec/tweet_overflow_spec.rb", "tweet_overflow.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jankubr/tweet_overflow}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Tweet_overflow", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{tweet_overflow}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Publishes your tweet with a link to content that didn't fit}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
