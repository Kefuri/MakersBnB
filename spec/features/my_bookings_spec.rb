feature 'My bookings page' do
  scenario 'visiting bookings/list shows a booking' do
    create_users_and_space_and_booking
    visit('/login')
    # josh is the user who is making this booking
    fill_in('email', with: 'josh@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Log in")
    visit('/bookings/list')

    expect(page).to have_content("Bob's space") # space name
    expect(page).to have_content("01/01/20") # booking start date
    expect(page).to have_content("02/01/20") # booking end date
  end
end