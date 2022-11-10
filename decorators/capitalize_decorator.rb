require_relative '../interface/nameable'

class CapitalizeDecorator < Nameable
  def correct_name
    @nameable.correct_name.capitalize()
  end
end