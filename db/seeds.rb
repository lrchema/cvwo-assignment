# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Type.destroy_all

none = Type.create!(name: "(blank)")
red = Type.create!(name: "red")
blue = Type.create!(name: "blue")
green = Type.create!(name: "green")
purple = Type.create!(name: "purple")
orange = Type.create!(name: "orange")

Status.destroy_all

notStart = Status.create!(name: "Not Started")
progress = Status.create!(name: "In Progress")
completed = Status.create!(name: "Completed")
deferred = Status.create!(name: "Deferred")
waiting = Status.create!(name: "Waiting on Others")

Priority.destroy_all

normal = Priority.create!(name: "normal")
low = Priority.create!(name: "low")
high = Priority.create!(name: "high")

Task.destroy_all

r1 = Task.create!(title: "is this", description: "the real life", start: "28-12-18", due_date: "30-12-18", end_date: "", status: notStart , priority: normal, type: blue)
r2 = Task.create!(title: "or is this", description: "just fantasy", start: "29-12-18", due_date: "31-12-18", end_date: "31-12-18", status: completed , priority: high, type: orange)