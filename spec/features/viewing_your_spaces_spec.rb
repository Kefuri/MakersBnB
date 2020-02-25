require 'spec_helper'

feature 'view your spaces' do
  scenario 'user wants to see their spaces after creation' do
    sign_up_and_sign_in
    create_cottage_listing
    click_link("Back to spaces")
    click_link("Your Listed Spaces")   
    expect(page).to have_content('Cute ass cottage')
  end
end
