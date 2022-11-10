require 'securerandom'

class Person
  attr_accessor :id, :name, :age, :parent_permission
  attr_reader :is_of_age

  public
  def initialize age, name='Unknown', parent_permission=true
    @id, @name, @age, @parent_permission = SecureRandom.hex(5), name, age, parent_permission
    @is_of_age = is_of_age?
  end

  def can_use_services?
    @is_of_age || @parent_permission
  end

  private
  def is_of_age?
    @age >= 18
  end

end