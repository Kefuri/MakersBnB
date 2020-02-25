require 'spec_helper'

feature 'create a listing' do
  scenario 'user enters a name, description and price for their space' do
    sign_up_and_sign_in
    create_cottage_listing
    expect(page).to have_content "Cute ass cottage"
  end
end
