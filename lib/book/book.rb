class Book
  attr_accessor :title, :author
  
  def initialize(title = 'Unknown', author = 'Unknown') # adding default by following Design Patters
    @title = title
    @author = author
    @rentals = []
  end

  def add(rental)
    rental.book = self
    @rentals << rental
  end
end