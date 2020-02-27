require 'spec_helper'

feature 'create a space' do

  scenario 'user enters a name, description and price for their space and sees their space' do
    sign_up_and_sign_in
    create_cottage_listing
    click_link("Back to spaces")
    expect(page).to have_content "Cute ass cottage"
  end

  scenario 'Make a different listing as a different user' do

    # make a listing as josh
    sign_up_and_sign_in
    create_cottage_listing
    click_link("Back to spaces")
    expect(page).to have_content "Cute ass cottage"

    # log in as haydon
    visit('/')
    fill_in('email', with: 'haydon@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Sign up")
    fill_in('email', with: 'haydon@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Log in")
    visit('/spaces/yours')

    # expect not to see josh's listing
    expect(page).not_to have_content "Cute ass cottage"

    # log in as josh and expect to see josh's
    visit('/login')
    fill_in('email', with: 'josh@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Log in")
    visit('/spaces/yours')
    expect(page).to have_content "Cute ass cottage"
    
  end
end
