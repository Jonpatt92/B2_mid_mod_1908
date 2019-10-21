require 'rails_helper'

describe Student, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cohort }
    it { should validate_presence_of :age }
    it { should validate_numericality_of(:age).only_integer }
    it { should validate_numericality_of(:cohort).only_integer }
  end

  describe "relationships" do
    it {should have_many(:instructor_students).dependent(:destroy)}
    it {should have_many(:instructors).through(:instructor_students)}
  end
end
