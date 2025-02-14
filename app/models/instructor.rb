class Instructor < ApplicationRecord
  has_many :instructor_students, :dependent => :destroy
  has_many :students, through: :instructor_students

  validates_presence_of :name

  def avg_student_age
    students.average(:age).to_i
  end
end
