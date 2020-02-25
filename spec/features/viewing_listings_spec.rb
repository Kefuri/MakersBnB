require 'spec_helper'

feature 'view listing page' do
  scenario 'user wants to see their listing after creation' do
    sign_up_and_sign_in
    create_cottage_listing
    expect(page).to have_content('Cute ass cottage')
    expect(page).to have_content('Your listings')
  end
end
