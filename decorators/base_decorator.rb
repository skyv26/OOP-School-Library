require_relative '../interface/nameable'

class Decorator < Nameable
  def initialize(nameable_object)
    @nameable = nameable_object
  end

  def correct_name
    @nameable.correct_name
  end
end