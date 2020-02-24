feature 'User Sign-Up' do
  scenario 'A user can create a new account' do
    visit('/')
    fill_in('email', with: 'josh@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Sign up")
    expect(page).to have_content("Please log in")
  end
end