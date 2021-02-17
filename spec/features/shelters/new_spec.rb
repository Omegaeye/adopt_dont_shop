require 'rails_helper'

RSpec.describe 'Create Shelter from index page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Silly Shelter", address: "123 Silly Ave", city: "Denver", state: "CO", zip: 80012)
  end

  it "Visitor can create a new shelter" do
    visit '/shelters'

    click_link 'New Shelter'

    expect(current_path).to eq('/shelters/new')

    fill_in "name", with: 'Pa and Paws'
    fill_in "address", with: 'road avenue'
    fill_in "city", with: 'Pitt'
    fill_in "state", with: 'PA'
    fill_in "zip", with: 12345

    click_on 'Create Shelter'

    expect(current_path).to eq('/shelters')

    expect(page).to have_content("Pa and Paws")

    visit '/shelters'

    click_link 'New Shelter'

    expect(current_path).to eq('/shelters/new')
    expect(page).to have_button('Create Shelter')
    click_button('Create Shelter')
    expect(page).to have_content("Shelter was not saved!")
  end
end
