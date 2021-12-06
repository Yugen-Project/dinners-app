require 'faker'

def clear_models
    User.destroy_all
    Restaurant.destroy_all
    Meal.destroy_all
    Order.destroy_all
end
p Devise

def add_user
    if !User.first == nil
        p ""
    else
        @s1 = User.create(email: "foo@bar.com", username: "adm", password:"123456")
        @s1.save!
        p @s1
        p User.first
        
    end
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
                    meal_id: m.id,
                    user_id: User.first.id
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
add_user()
add_restaurants()
