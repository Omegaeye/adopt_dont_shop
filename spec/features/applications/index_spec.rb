require 'rails_helper'

RSpec.describe 'Application Index page' do
  before :each do
    Shelter.destroy_all
    Application.destroy_all
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @application1 = Application.create!(name: "Julie", address: "123 Fake St", city: "Denver", state: "CO", zip: 80123, description: "Tall", status: "In Progress")
    @application2 = Application.create!(name: "Jasmine", address: "123 Bold St", city: "Denver", state: "CO", zip: 80123, description: "Mama", status: "In Progress")

  end
    it "displays applicant w/ corresponding id with attributes" do

      visit "/applications"


      expect(page).to have_content("#{@application1.name}")
      expect(page).to have_content("#{@application1.address}")
      expect(page).to have_content("#{@application1.city}")
      expect(page).to have_content("#{@application1.state}")
      expect(page).to have_content("#{@application1.zip}")

      expect(page).to have_link("#{@application1.name}")
      click_link("#{@application1.name}")
      expect(current_path).to eq("/applications/#{@application1.id}")
    end

    it "can delete applications" do
      visit '/applications'

      expect(page).to have_button("Delete #{@application1.name}'s Application")
      click_button("Delete #{@application1.name}'s Application")
      expect(page).to_not have_content("#{@application1.name}")
    end
end
