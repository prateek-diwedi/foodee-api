# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.create(title: 'Hello world',content: 'lorem ipso',slug: 'hello-world')

User.create(name: "apama",email: "a@a.com",password: "abc")
Review.create(review_text: "it was really nice", res_id: 16618773, user_id: 1)