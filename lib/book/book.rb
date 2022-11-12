class Book
  attr_accessor :title, :author
  
  def initialize(title = 'Unknown', author = 'Unknown') # adding default by following Design Patters
    @title = title
    @author = author
  end
end