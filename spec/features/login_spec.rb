feature 'User Log-In' do

  scenario 'A non-existant user cannot log in' do
    visit('/')
    fill_in('email', with: 'josh@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Sign up")
    expect(page).to have_content("Please log in")
    fill_in('email', with: 'pete@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Log in")
    expect(page).to have_content("Please log in")
  end

  scenario 'An existing user can log in' do
    visit('/')
    fill_in('email', with: 'josh@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Sign up")
    expect(page).to have_content("Please log in")
    fill_in('email', with: 'josh@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Log in")
    expect(page).to have_content("Spaces")
  end

end