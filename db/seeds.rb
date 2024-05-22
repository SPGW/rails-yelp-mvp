# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

italian = {name: 'Italian Pizza', address: 'Italy', phone_number: '063484279', category: 'italian'}
chinese = {name: 'Chinese Noodles', address: 'London', phone_number: '064829482', category: 'chinese'}
japanese = {name: 'Japanese Sushi', address: 'Tokyo', phone_number: '064729475', category: 'japanese'}
french = {name: 'French Fries', address: 'Paris', phone_number: '065686866', category: 'french'}
belgian = {name: 'Belgian Chocolates', address: 'Amsterdam', phone_number: '061234567', category: 'belgian'}

[italian, chinese, japanese, french, belgian].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  Review.create(content: 'pretty good', rating: 4, restaurant_id: restaurant.id)
  puts "Created #{restaurant.name}"
end

puts "Finished!"
