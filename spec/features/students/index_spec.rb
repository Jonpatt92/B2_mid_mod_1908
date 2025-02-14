require 'rails_helper'

RSpec.describe "When I visit the student index page" do
  before :each do
    @instructor_1 = Instructor.create(name: "Meghan")
    @instructor_2 = Instructor.create(name: "Ian")
    @instructor_3 = Instructor.create(name: "Mike")

    @student_1 = @instructor_1.students.create(name: "John", cohort: 1908, age: 30)
    @student_2 = @instructor_1.students.create(name: "Mary", cohort: 1909, age: 24)
    @student_3 = @instructor_2.students.create(name: "Michael", cohort: 1910, age: 28)
  end

  it "Shows me each students' info" do
    visit '/students'

    expect(page).to have_content("John")
    expect(page).to have_content("Mary")
    expect(page).to have_content("Michael")
    expect(page).to have_content("Cohort: 1908")
    expect(page).to have_content("Cohort: 1909")
    expect(page).to have_content("Cohort: 1910")


    within "#student-#{@student_1.id}" do
      expect(page).to have_link(@instructor_1.name)
    end

    within "#student-#{@student_2.id}" do
      expect(page).to have_link(@instructor_1.name)
    end

    within "#student-#{@student_3.id}" do
      expect(page).to have_link(@instructor_2.name)
    end
  end
end
