require 'rails_helper'

RSpec.describe "Instructors' show page" do
  before :each do
    @instructor_1 = Instructor.create(name: "Meghan")
    @instructor_2 = Instructor.create(name: "Ian")
    @instructor_3 = Instructor.create(name: "Mike")

    @student_1 = @instructor_1.students.create(name: "John", cohort: 1908, age: 30)
    @student_2 = @instructor_1.students.create(name: "Mary", cohort: 1909, age: 24)
    @student_3 = @instructor_1.students.create(name: "Michael", cohort: 1910, age: 28)
    @student_4 = @instructor_2.students.create(name: "Jonathan", cohort: 1908, age: 27)
    @student_5 = @instructor_2.students.create(name: "Brian", cohort: 1908, age: 30)
    @student_6 = @instructor_2.students.create(name: "Graham", cohort: 1908, age: 32)
  end

  it "Shows me each instructors info" do
    visit '/students'
    expect(page).to have_link(@instructor_1.name)
    expect(page).to have_link(@instructor_2.name)
    click_link "#{@instructor_1.name}"

    expect(current_path).to eq("/instructors/#{@instructor_1.id}")
    expect(page).to have_content("Meghan")
    expect(page).to have_content("John")
    expect(page).to have_content("Mary")
    expect(page).to have_content("Michael")
    expect(page).to have_content("Average Student Age: 27")
  end
end
