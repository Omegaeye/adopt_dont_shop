# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all
new_home = Shelter.create!(name: "New Home", address: "123 Fake St", city: "Denver", state: "CO", zip: "80012")
adopt_now = Shelter.create!(name: "Adopt Now", address: "789 Made St", city: "Mountain", state: "CO", zip: "80123")
rehome = Shelter.create!(name: "ReHome", address: "154 Renow", city: "Reagain", state: "CO", zip: "80021")
pet_happy = Shelter.create!(name: "Pet Happy", address: "456 Main St", city: "Denver", state: "CO", zip: "80021")

andrew_app = Application.create!(name: "Andrew", address: "123 Main St", city: "Denver", state: "CO", zip: "80021")
khoa_app = Application.create!(name: "Khoa", address: "321 Broadway St", city: "Denver", state: "CO", zip: "80021")
jake_app = Application.create!(name: "Jake", address: "987 Genius Ct", city: "Denver", state: "CO", zip: "80021")
kupo = Application.create!(name: "Kupo", address: "321 Broadway St", city: "Denver", state: "CO", zip: "80021")




buddy = new_home.pets.create!(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20113314/Carolina-Dog-standing-outdoors.jpg", name: "Buddy", approximate_age: 4, description: "Doggy", adoptable: true, sex: :male)
spiky = new_home.pets.create!(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20113314/Carolina-Dog-standing-outdoors.jpg", name: "Spiky", approximate_age: 2, description: "Doggy", adoptable: true, sex: :male)
cookie = rehome.pets.create!(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20113314/Carolina-Dog-standing-outdoors.jpg", name: "Cookie", approximate_age: 4, description: "Kitty", adoptable: true, sex: :female)
fluffy = rehome.pets.create!(image: "https://ei.marketwatch.com/Multimedia/2020/04/09/Photos/ZQ/MW-IE203_corona_20200409232441_ZQ.jpg?uuid=d12f4334-7ada-11ea-b13a-9c8e992d421e", name: "Fluffy", approximate_age: 1, description: "Kitty", adoptable: true, sex: :female)
freya = adopt_now.pets.create!(image: "https://ei.marketwatch.com/Multimedia/2020/04/09/Photos/ZQ/MW-IE203_corona_20200409232441_ZQ.jpg?uuid=d12f4334-7ada-11ea-b13a-9c8e992d421e", name: "Freya", approximate_age: 2, description: "Kitty", adoptable: true, sex: :female)
angel = adopt_now.pets.create!(image: "https://ei.marketwatch.com/Multimedia/2020/04/09/Photos/ZQ/MW-IE203_corona_20200409232441_ZQ.jpg?uuid=d12f4334-7ada-11ea-b13a-9c8e992d421e", name: "Angel", approximate_age: 1, description: "Kitty", adoptable: true, sex: :female)
wuff = pet_happy.pets.create!(image: "https://ei.marketwatch.com/Multimedia/2020/04/09/Photos/ZQ/MW-IE203_corona_20200409232441_ZQ.jpg?uuid=d12f4334-7ada-11ea-b13a-9c8e992d421e", name: "Wuff", approximate_age: 3, description: "Kitty", adoptable: true, sex: :male)
weenie = pet_happy.pets.create!(image: "https://ei.marketwatch.com/Multimedia/2020/04/09/Photos/ZQ/MW-IE203_corona_20200409232441_ZQ.jpg?uuid=d12f4334-7ada-11ea-b13a-9c8e992d421e", name: "Weenie", approximate_age: 1, description: "Kitty", adoptable: true, sex: :female)

PetApplication.create!(pet: buddy, application: andrew_app)
PetApplication.create!(pet: spiky, application: andrew_app)
PetApplication.create!(pet: cookie, application: khoa_app)
PetApplication.create!(pet: fluffy, application: khoa_app)
PetApplication.create!(pet: freya, application: jake_app)
PetApplication.create!(pet: angel, application: jake_app)

andrew_app.update(description: "Awesome", status: "Pending")
khoa_app.update(description: "Awesome", status: "Pending")
jake_app.update(description: "Not_Awesome", status: "Pending")
