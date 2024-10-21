# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

#until Country.count == 20 do

    #Country.create(name: Faker::Address.country) if
    #!Country.pluck(:name).include?(Faker::Address.country)

#end


until Article.count == 100 do

Article.create(title: Faker::Book.title, description:

Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), when_went:

Faker::Date.between(from: 10.years.ago, to: Date.today), country_id:

rand(1..20))

end
