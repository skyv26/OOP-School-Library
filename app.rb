require './lib/student'
require './lib/teacher'

$basicUI = <<-DOC
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
    @person_List = []
    @return_Check = true
  end

  def choice(num)
    case num
    when 1
      puts
      if @person_List.empty?
        print "\nPlease first add some person\n"
        true
      else
        @person_List.each_with_index do |person, index|
          puts "#{index + 1} [#{person.class.name}] => ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
        end
      end
    when 2
      true
    when 3
      print 'Do you want to create a student (1) or a teacher (2) ? [Input the number] : '
      personChoice = gets.to_i
      if(personChoice == 1)
        print 'Age : '
        age = gets.chomp
        print 'Classroom : '
        classroom = gets.chomp
        print 'Name : '
        name = gets.chomp
        print 'Has parent permission ? [Y/N] : '
        parent_permission = gets.chomp
        if(parent_permission.downcase == 'y' || parent_permission == 'Y')
          parent_permission = true
        elsif(parent_permission.downcase == 'n' || parent_permission == 'N')
          parent_permission = false
        end
      @person_List << Student.new(age, classroom, name: name, parent_permission: parent_permission)
      elsif(personChoice == 2)
        print 'Age : '
        age = gets.chomp
        print 'Name : '
        name = gets.chomp
        print 'Specialization : '
        specialization = gets.chomp
        @person_List << Teacher.new(age, specialization, name: name)
      else
        return true
      end
    when 4
      true
    when 5
      true
    when 6
      true
    when 7
      exit
    else
      true
    end

  end

  def run
    puts
    while @return_Check
      print $basicUI
      print 'Enter your choice : '
      choice = gets.to_i
      @return_Check = self.choice(choice)
      puts
    end
  end
end