#!/usr/bin/env rake

require 'rspec/core/rake_task'
require File.expand_path('../src/app', __FILE__)

RSpec::Core::RakeTask.new(:spec)

task :default  => :spec

desc "Run the inbuilt testcases"
task :testcase do
  app = App.new :testcase, "5 5 1 2 N LMLMLMLMM 3 3 E MMRMMRMRRM"
  app.run
end

desc "Get the input from user"
task :input do
  app = App.new :input
  app.run
end
