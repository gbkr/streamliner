require 'streamliner/version'
require 'streamliner/counter'

if defined?(Rails)
  require 'streamliner/railtie'
  require 'streamliner/controller_interceptor'
end

begin
  require 'pry'
rescue LoadError
end

module Streamliner
end
