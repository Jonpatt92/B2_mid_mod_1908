require 'rails_helper'

describe Instructor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it {should have_many(:instructor_students).dependent(:destroy)}
    it {should have_many(:students).through(:instructor_students)}
  end

  describe "instance methods" do
    before :each do
      @instructor_1 = Instructor.create(name: "Meghan")
      @instructor_2 = Instructor.create(name: "Ian")
      @student_1 = @instructor_1.students.create(name: "John", cohort: 1908, age: 30)
      @student_2 = @instructor_1.students.create(name: "Mary", cohort: 1908, age: 24)
      @student_3 = @instructor_1.students.create(name: "Michael", cohort: 1908, age: 28)
      @student_4 = @instructor_2.students.create(name: "Jonathan", cohort: 1908, age: 27)
      @student_5 = @instructor_2.students.create(name: "Brian", cohort: 1908, age: 30)
      @student_6 = @instructor_2.students.create(name: "Graham", cohort: 1908, age: 32)
    end

    it "avg_student_age" do
      expect(@instructor_1.avg_student_age).to eq(27)
      expect(@instructor_2.avg_student_age).to eq(29)
    end
  end
end
