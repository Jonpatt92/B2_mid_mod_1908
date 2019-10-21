# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

instructor_1 = Instructor.create(name: "Meghan")
instructor_2 = Instructor.create(name: "Ian")
student_1 = instructor_1.students.create(name: "John", cohort: 1908, age: 30)
student_2 = instructor_1.students.create(name: "Mary", cohort: 1908, age: 24)
student_3 = instructor_1.students.create(name: "Michael", cohort: 1908, age: 28)
student_4 = instructor_2.students.create(name: "Jonathan", cohort: 1908, age: 27)
student_5 = instructor_2.students.create(name: "Brian", cohort: 1908, age: 30)
student_6 = instructor_2.students.create(name: "Graham", cohort: 1908, age: 32)
