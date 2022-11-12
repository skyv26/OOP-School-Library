require './lib/student'
require './lib/teacher'
require './lib/book/book'
require './lib/rental/rental'

class App
  def initialize
    @book_list = []
    @person_list = []
    @rental_list = []
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
      book_collection
    when 2
      person_collection
    when 3
      person_choice?
    when 4
      book_choice
    when 5
      rental_choice
    when 6
      all_rental
    end
  end

  def book_collection
    puts
    if @book_list.empty?
      print "\nPlease first add some book\n"
    else
      @book_list.each_with_index do |book, index|
        puts "[#{index + 1}] Title : #{book.title}, Author: #{book.author}"
      end
    end
  end

  def person_collection
    puts
    if @person_list.empty?
      print "\nPlease first add some person\n"
    else
      @person_list.each_with_index do |person, index|
        puts "#{index + 1}) [#{person.class.name}] => ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
  end

  def rental_choice
    print "Select a book from the following list by number:\n"
    book_collection
    return true if @book_list.empty?

    book_index = gets.chomp.to_i - 1
    print "Select a person from the following list by number:\n"
    person_collection
    return true if @person_list.empty?

    person_index = gets.chomp.to_i - 1
    print 'Date [dd/mm/yyyy] : '
    date = gets.chomp
    rental = Rental.new(@person_list[person_index], @book_list[book_index], date)
    @rental_list << rental unless @rental_list.include?(rental)
    puts 'Rental Created Successfully !!'
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

  def book_choice
    print 'Book Title : '
    title = gets.chomp
    print 'Book Author : '
    author = gets.chomp
    @book_list << Book.new(title, author)
    puts 'Book Created Successfully !!'
  end

  def all_rental
    print 'Enter a person ID: '
    p_id = gets.chomp
    if !@person_list.find { |person| person.id == p_id }
      puts "No rental found with ID: #{p_id}"
    elsif @rental_list.empty?
      puts 'Please add some rentals'
    else
      puts
      @rental_list.select do |rental|
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == p_id
      end
    end
  end
end
