require 'securerandom'

class Person
  attr_accessor :id, :name, :age, :parent_permission
  attr_reader :is_of_age
  alias is_of_age? of_age?

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = SecureRandom.hex(5)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @is_of_age = is_of_age?
  end

  def can_use_services?
    @is_of_age || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
