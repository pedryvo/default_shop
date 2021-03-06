# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ['Animais e Acessórios',
              'Esportes',
              'Para a sua casa',
              'Eletrônicos e celulares',
              'Música e hobbies',
              'Bebês e crianças',
              'Moda e beleza',
              'Veículos e barcos',
              'Imóveis']

categories.each {|description| Category.find_or_create_by(description: description)}

# ADM Padrão
Admin.create!(email: 'admin@admin.com', name: 'Administrador Geral', password: '12345678', password_confirmation: '12345678', role: 0)
# Other admins
10.times do
  Admin.create!(email: Faker::Internet.email, name: Faker::Name.name_with_middle, password: '12345678', password_confirmation: '12345678', role: [0,1].sample)
end

# Ads
100.times do
  Ad.create!(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, member: Member.all.sample, category: Category.all.sample)
end