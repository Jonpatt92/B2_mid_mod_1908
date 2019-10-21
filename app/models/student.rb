class Student < ApplicationRecord
  has_many :instructor_students, :dependent => :destroy
  has_many :instructors, through: :instructor_students

  validates_presence_of :name,
                        :cohort,
                        :age

  validates_numericality_of :age, only_integer: true
  validates_numericality_of :cohort, only_integer: true

end
