require './lib/student'
require './lib/teacher'

class App
  def initialize
    @person_list = []
    @return_check = true
  end

  def create_student
    print 'Age : '
    age = gets.chomp
    print 'Classroom : '
    classroom = gets.chomp
    print 'Name : '
    name = gets.chomp
    print 'Has parent permission ? [Y/N] : '
    parent_permission = gets.chomp
    if parent_permission.downcase == 'y' || parent_permission == 'Y'
      parent_permission = true
    elsif parent_permission.downcase == 'n' || parent_permission == 'N'
      parent_permission = false
    end
    @person_list << Student.new(age, classroom, name: name, parent_permission: parent_permission)
  end

  def create_teacher
    print 'Age : '
    age = gets.chomp
    print 'Name : '
    name = gets.chomp
    print 'Specialization : '
    specialization = gets.chomp
    @person_list << Teacher.new(age, specialization, name: name)
  end

  def choice(num)
    case num
    when 1
      puts
      if @person_list.empty?
        print "\nPlease first add some person\n"
      else
        @person_list.each_with_index do |person, index|
          puts "#{index + 1} [#{person.class.name}] => ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
        end
      end
    when 3
      person_choice?
      true
    when 7
      exit
    end
  end

  def person_choice?
    print 'Do you want to create a student (1) or a teacher (2) ? [Input the number] : '
    person_choice = gets.to_i
    case person_choice
    when 1
      create_student
    when 2
      create_teacher
    else
      true
    end
    puts 'Person Created Successfully !!'
  end

  def run
    puts
    while @return_check
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
      @return_check = self.choice(choice)
      puts
    end
  end
end
