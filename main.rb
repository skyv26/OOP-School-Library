#!/usr/bin/env ruby
require_relative 'app'

def main
  app = App.new
  puts
  loop do
    print <<~DOC
      Please choose an option by entering a number:

      1 - List all books
      2 - List all people
      3 - Create a person
      4 - Create a book
      5 - Create a rental
      6 - List all rentals for a given person id
      7 - Exit

    DOC
    print 'Enter your choice : '
    choice = gets.to_i
    exit if choice == 7
    app.choice(choice)
    puts
  end
end

print <<~DOC
  ***********************************************
  Welcome to OOP School Library Management System
  ***********************************************
DOC
main
