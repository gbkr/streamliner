require 'streamliner/version'
require 'streamliner/counter'
require 'streamliner/report'

if defined?(Rails)
  require 'streamliner/railtie'
  require 'streamliner/controller_interceptor'
end

module Streamliner
end
