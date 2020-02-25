require 'spec_helper'

feature 'view listiung page' do
  scenario 'user wants to see their listing after creation' do
    visit('/listings/create')
    fill_in "name_field", with: "Cute ass cottage"
    fill_in "desc_field", with: "This cottage is deadass so cute"
    fill_in "price_field", with: "69"
    click_button("Add Listing")
    click_link("Back to listings")

    expect(page).to have_content('Cute ass cottage')
  end
end
