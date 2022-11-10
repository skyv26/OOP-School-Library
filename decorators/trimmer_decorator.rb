require_relative './base_decorator'

class TrimmerDecorator < Decorator
  def correct_name
    if @nameable.correct_name.length > 10
      return @nameable.correct_name[0...10]
    end
  end
end