# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all

c1 = Cat.create(color: 'brown', name: 'choco', sex: 'M', description: 'Evil little brown cat', birth_date: Date.new(2012,8,12))
c2 = Cat.create(color: 'orange', name: 'basketball', sex: 'M', description: 'Fat round orange cat, looks like a basketball', birth_date: Date.new(2016,9,11))
c3 = Cat.create(color: 'brown', name: 'mud', sex: 'F', description: 'Rough and tough large cat', birth_date: Date.new(2007,1,23))
c4 = Cat.create(color: 'gray', name: 'dusty', sex: 'F', description: 'Creepy little cat, likes to lerk in the shadows', birth_date: Date.new(2018,4,20))
c5 = Cat.create(color: 'white', name: 'snow', sex: 'F', description: 'Fancy white puff ball cat', birth_date: Date.new(1956,12,26))
c6 = Cat.create(color: 'black', name: 'obsidian', sex: 'M', description: 'Sleek beautiful cat, dark as night', birth_date: Date.new(2019,6,13))