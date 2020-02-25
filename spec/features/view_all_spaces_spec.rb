require 'spec_helper'

feature 'view listing page' do
  scenario 'user wants to see their listing after creation' do
    sign_up_and_sign_in
    create_cottage_listing
    click_link("Back to spaces")    
    expect(page).to have_content('Cute ass cottage')
  end
end
