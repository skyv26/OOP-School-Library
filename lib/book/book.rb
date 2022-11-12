class Book
  attr_accessor :title, :author

  # adding default by following Design Patters
  def initialize(title = 'Unknown', author = 'Unknown')
    @title = title
    @author = author
    @rentals = []
  end

  def add(rental)
    rental.book = self
    @rentals << rental
  end
end
