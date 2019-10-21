class Student < ApplicationRecord
  has_many :instructor_students, :dependent => :destroy
  has_many :instructors, through: :instructor_students

  validates_presence_of :name,
                        :cohort,
                        :age
end
