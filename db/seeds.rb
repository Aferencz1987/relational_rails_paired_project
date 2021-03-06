# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Manufacturers
fender = Manufacturer.create(brand: "Fender", days_since_last_incident: 109, domestic: false)
gibson = Manufacturer.create(brand: "Gibson", days_since_last_incident: 54, domestic: false)
prs = Manufacturer.create(brand: "PRS", days_since_last_incident: 259, domestic: true)
taylor = Manufacturer.create(brand: "Taylor", days_since_last_incident: 369, domestic: false)

# Guitars
gibson.guitars.create!(model: "Explorer", price: 899.99, sold: false)
gibson.guitars.create(model: "Les Paul", price: 2999.99, sold: true)
fender.guitars.create(model: "Telecaster", price: 1199.99, sold: true)
fender.guitars.create(model: "Stratocaster", price: 1499.99, sold: false)
prs.guitars.create(model: "CE Standard 24", price: 899.99,sold: false)
prs.guitars.create(model: "Silver Sky", price: 1999.99, sold: false)
taylor.guitars.create(model: "C214 Grand Parlor", price: 899.99, sold: false)

# Stores
ace = Store.create(name: "Ace Hardware", distance: 20, open: true)
lowes = Store.create(name: "Lowes", distance: 18, open: true)
guirys = Store.create(name: "Guiry's Hardware", distance: 5, open: false)

# Tools
ace.tools.create(name: "Steel Hammer", price: 25.00, on_sale: false)
ace.tools.create(name: "Handy Dandy Screwdriver", price: 11.00, on_sale: true)
lowes.tools.create(name: "Lucky Ladder", price: 119.00, on_sale: false)
lowes.tools.create(name: "Table Saw for magicians", price: 159.00, on_sale: false)
guirys.tools.create(name: "Loose screws", price: 1.00, on_sale: false)
guirys.tools.create(name: "Morning Lumber", price: 25.00, on_sale: true)
