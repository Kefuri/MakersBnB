feature 'logout' do
  scenario 'A logged in user can log out' do
    # log in as josh and make a listing
    sign_up_and_sign_in
    create_cottage_listing
    click_link('Back to spaces')
    click_link('Log out')
    expect(page).to have_content("Please log in")
    expect(current_path).to eq('/login')
    # sign up and log in as haydon, don't make a listing
    visit('/')
    fill_in('email', with: 'haydon@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Sign up")
    fill_in('email', with: 'haydon@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Log in")
    visit('/spaces/yours')
    # expect not to see josh's listing
    expect(page).not_to have_content("Cute ass cottage")
  end
end