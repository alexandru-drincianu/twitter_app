# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u1 = User.create!(
    name: "Alex", 
    email:"alex@gmail.com", 
    age: 22, 
    gender:"Male",
    phone_number:"0789127381",
    password: "123",
    admin: true
)

u2 = User.create!(
    name: "Ana", 
    email:"ana@gmail.com", 
    age: 19, 
    gender:"Female",
    phone_number:"0713512566",
    password: "123",
    admin: false
)

u3 = User.create!(
    name: "Dan", 
    email:"dan@gmail.com", 
    age: 17, 
    gender:"Male",
    phone_number:"0786321712",
    password: "123",
    admin: true
)

u4 = User.create!(
    name: "Diana", 
    email:"diana@gmail.com", 
    age: 23, 
    gender:"Female",
    phone_number:"078872131",
    password: "123",
    admin: false
)

u5 = User.create!(
    name: "Mike", 
    email:"mike@gmail.com", 
    age: 19, 
    gender:"Male",
    phone_number:"0725738123",
    password: "123",
    admin: false
)

20.times do u1.posts.create!(title: "Post", description: "asdasdasda") end
20.times do u2.posts.create!(title: "Post", description: "asdasdasda") end
20.times do u3.posts.create!(title: "Post", description: "asdasdasda") end
20.times do u4.posts.create!(title: "Post", description: "asdasdasda") end
20.times do u5.posts.create!(title: "Post", description: "asdasdasda") end

