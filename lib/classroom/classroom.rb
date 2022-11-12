class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label)
    @label = label
    @student = []
  end

  def add(student)
    student.classroom = self
    @student << student
  end
end