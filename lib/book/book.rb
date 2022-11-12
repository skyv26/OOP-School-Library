require_relative '../rental/rental'

class Book
  attr_accessor :title, :author, :rentals

  # adding default by following Design Patters
  def initialize(title = 'Unknown', author = 'Unknown')
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
