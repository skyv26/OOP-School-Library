class Book
  attr_accessor :title, :author
  
  def initialize(title = 'Unknown', author = 'Unknown') # adding default by following Design Patters
    @title = title
    @author = author
    @rental_list = []
  end

  def add(rental)
    rental.book = self
    @rental_list << rental
  end
end