require 'spec_helper'

feature 'create a listing' do
  scenario 'user enters a name, description and price for their space' do
    visit('/listings/create')
    fill_in "name_field", with: "Cute ass cottage"
    fill_in "desc_field", with: "This cottage is deadass so cute"
    fill_in "price_field", with: "69"
    click_button("Add Listing")
    expect(page).to have_content "Your space has been listed!"
  end
end
