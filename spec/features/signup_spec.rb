require_relative '../webhelpers.rb'

feature 'User Sign-Up' do
  scenario 'A user can create a new account' do
    sign_up
    expect(page).to have_content("Please log in")
  end
end