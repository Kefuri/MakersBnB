require_relative '../webhelpers.rb'

feature 'User Log-In' do
  
  scenario 'A non-existing user cannot log in' do
    sign_up # as josh@wemail.com
    expect(page).to have_content("Please log in")
    fill_in('email', with: 'pete@wemail.com') # won't match, different email
    fill_in('password', with: 'secretpassword')
    click_button("Log in")
    expect(page).to have_content("Please log in")
  end

  scenario 'An existing user can log in' do
    sign_up # as josh@wemail.com
    expect(page).to have_content("Please log in")
    fill_in('email', with: 'josh@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Log in")
    expect(page).to have_content("josh@wemail.com")
    #testing for signed in user's email
  end

end