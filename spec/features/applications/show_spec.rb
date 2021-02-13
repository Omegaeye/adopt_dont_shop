require 'rails_helper'

RSpec.describe 'Application Show page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @application1 = Application.create!(name: "Julie", address: "123 Fake St", city: "Denver", state: "CO", zip: 80123, description: "Tall", status: "pending")
  end
    it "displays applicant w/ corresponding id with attributes" do

      visit "/applications/#{@application1.id}"

      expect(page).to have_content("Name: #{@application1.name}")
      expect(page).to have_content("Address: #{@application1.address}")
      expect(page).to have_content("City: #{@application1.city}")
      expect(page).to have_content("State: #{@application1.state}")
      expect(page).to have_content("Zip: #{@application1.zip}")
    end
end
