require 'rails_helper'

RSpec.describe "application new page" do

  before :each do
    new_home = Shelter.create!(name: "New Home", address: "123 Fake St", city: "Denver", state: "CO", zip: "80012")
    adopt_now = Shelter.create!(name: "Adopt Now", address: "789 Made St", city: "Mountain", state: "CO", zip: "80123")
    andrew_app = Application.create!(name: "Andrew", address: "123 Main St", city: "Denver", state: "CO", zip: "80021")
    khoa_app = Application.create!(name: "Khoa", address: "321 Broadway St", city: "Denver", state: "CO", zip: "80021")
    buddy = new_home.pets.create!(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20113314/Carolina-Dog-standing-outdoors.jpg", name: "Buddy", approximate_age: 4, description: "Doggy", adoptable: true, sex: :male)
    spiky = new_home.pets.create!(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20113314/Carolina-Dog-standing-outdoors.jpg", name: "Spiky", approximate_age: 2, description: "Doggy", adoptable: true, sex: :male)
  end

  it "Admin Applications contents and attributes" do

  end
end
