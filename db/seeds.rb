require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# f_names = ["charli", "mat's", "crazy", "red", "southern"]
# l_names = ["lobster", "grill", "chicken", "beafy", "flames"]
# loc = ["22 locness road", "32 mike pence ave", "345 luca dr", "12 emily sande blvd", "3F 123 bleaker st", "45 Tsim sha Tsui", "54 anders lu", "123 hello rd"]
# description
# Faker::Restaurant.name          #=> "Curry King"

# Faker::Restaurant.type          #=> "Comfort Food"

# Faker::Restaurant.description   #=> "We are committed to using the finest ingredients in our recipes. No food leaves our kitchen that we ourselves would not eat."
# restaurant_img_url: nil, tables: nil, location: nil, contact: nil, avail_tables: nil
# Faker::Restaurant.review   

# food
# Faker::Food.description #=> "Three eggs with cilantro, tomatoes, onions, avocados and melted Emmental cheese. With a side of roasted potatoes, and your choice of toast or croissant."

# Faker::Food.dish #=> "Caesar Salad"

def clear_models
    Restaurant.destroy_all
    Meal.destroy_all
    Order.destroy_all
end

def add_restaurants
    10.times do |i|
        r = Restaurant.new(
            name: Faker::Restaurant.name,
            location: Faker::Restaurant.type,
            description: Faker::Restaurant.description,
            restaurant_img_url: "https://source.unsplash.com/random/400x400",
            tables: [1,2,3,4,5,6,7,8,9,10].sample,
            contact: "+123 4567 8901",
            avail_tables: [1,2,3,4,5].sample  
        )
        r.save
        puts "#{r.name} added"
        10.times do |j|
            m = r.meals.new(
                 name: Faker::Food.dish , 
                 description: Faker::Food.description, 
                 meal_img_url: "https://source.unsplash.com/random/400x400", 
                 price: "$ #{[10,15,20,25,30].sample}"
                 )
            m.save
            5.times do |o|
                o = Order.new(
                    date: DateTime.now(), 
                    quantity: [1,2,3,4,5].sample, 
                    restaurant_id: r.id, 
                    meal_id: m.id
                    )
                o.save
                puts "#{o.id} added"               
            end
            puts "#{m.name} added"
         end
    end 
    puts Restaurant.count    
end

clear_models()
add_restaurants()
