require './lib/person'

$basicUI = <<-DOC
***********************************************
Welcome to OOP School Library Management System
***********************************************

Please choose an option by entering a number:

1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person id
7 - Exit

DOC

class App

  def initialize
    @returnCheck = true
  end

  def choice(num)
    case num
    when 1
      true
    when 2
      true
    when 3
      print 'Do you want to create a student (1) or a teacher (2) ? [Input the number] : '
      personChoice = gets.to_i
    when 4
      true
    when 5
      true
    when 6
      true
    when 7
      true
    else
      true
    end

  end

  def run
    puts
    while @returnCheck
      print $basicUI
      print 'Enter your choice : '
      choice = gets.to_i
      @returnCheck = self.choice(choice)
      puts
    end
  end
end