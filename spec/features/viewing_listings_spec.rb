require 'spec_helper'

feature 'view listing page' do
  scenario 'user wants to see their listing after creation' do
    create_cottage_listing
    expect(page).to have_content('Cute ass cottage')
  end
end
