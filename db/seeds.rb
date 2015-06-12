require 'faker'

Category.all.each do |category|
  5.times do
    Article.create(category_id: category.id, author: Faker::Name.name, price: Faker::Number.number(3), title: Faker::Company.name, description: Faker::Lorem.sentence, encryption_key: SecureRandom.hex(6))
  end
end
