require 'rails_helper'

RSpec.describe "Admin Shelter Index Page" do

  before :each do
    new_home = Shelter.create!(name: "New Home", address: "123 Fake St", city: "Denver", state: "CO", zip: "80012")
    adopt_now = Shelter.create!(name: "Adopt Now", address: "789 Made St", city: "Mountain", state: "CO", zip: "80123")
    andrew_app = Application.create!(name: "Andrew", address: "123 Main St", city: "Denver", state: "CO", zip: "80021")
    khoa_app = Application.create!(name: "Khoa", address: "321 Broadway St", city: "Denver", state: "CO", zip: "80021")
    buddy = new_home.pets.create!(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20113314/Carolina-Dog-standing-outdoors.jpg", name: "Buddy", approximate_age: 4, description: "Doggy", adoptable: true, sex: :male)
    spiky = new_home.pets.create!(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20113314/Carolina-Dog-standing-outdoors.jpg", name: "Spiky", approximate_age: 2, description: "Doggy", adoptable: true, sex: :male)
    PetApplication.create!(pet: buddy, application: khoa_app)
    khoa_app.update(description: "Awesome", status: "Pending")

  end

  it "shows shelter name and attributes " do
    visit 'admin/shelters'

    expect(page).to have_content("New Home")
    expect(page).to have_content("123 Fake St")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
    expect(page).to have_content("80012")
    expect(page).to have_content("Adopt Now")

    expect(page).to have_content("Shelter's with Pending Applications")
    expect(page).to have_link("New Home's Shelter")
    click_link("New Home's Shelter")
  end
end
