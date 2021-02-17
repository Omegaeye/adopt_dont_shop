require 'rails_helper'

RSpec.describe 'Application Show page' do
  before :each do
    Shelter.destroy_all
    Application.destroy_all
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @application1 = Application.create!(name: "Julie", address: "123 Fake St", city: "Denver", state: "CO", zip: 80123, description: "Tall", status: "pending")
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")

  end
    it "displays applicant w/ corresponding id with attributes" do

      visit "/applications/#{@application1.id}"
      expect(page).to have_content("#{@application1.name}")
      expect(page).to have_content("Address: #{@application1.address}")
      expect(page).to have_content("City: #{@application1.city}")
      expect(page).to have_content("State: #{@application1.state}")
      expect(page).to have_content("Zip: #{@application1.zip}")

      fill_in :pet_name, with: "Thor"
      click_button('Search Pet by Name')

      expect(page).to have_content("Thor")
      expect(page).to have_button("Adopt #{@pet1.name}")
      click_button("Adopt #{@pet1.name}")

      fill_in :description, with: "I'm alright"
      click_button('submit application')
    end
end
