#!/usr/bin/env ruby
require_relative 'app'

def main
  app = App.new
  app.run
end

print <<~DOC
  ***********************************************
  Welcome to OOP School Library Management System
  ***********************************************
DOC
main
