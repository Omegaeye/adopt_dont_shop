require 'rails_helper'

RSpec.describe "application new page" do
  it "create new application" do
    visit "/pets"

    expect(page).to have_link("Start an Application")
    click_link("Start an Application")
    expect(current_path).to eq("/applications/new")
    fill_in "name", with: "Mike"
    fill_in "address", with: "123 Fake St"
    fill_in "city", with: "Doomcity"
    fill_in "state", with: "CO"
    fill_in "zip", with: 80116
    fill_in "description", with: "Purple Hair"
    click_button "submit"
    
  end

end
