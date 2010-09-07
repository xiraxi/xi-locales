
ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

load XiraxiCore.root.join("features/support/env.rb")
