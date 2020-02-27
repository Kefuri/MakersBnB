feature 'My bookings page' do
  scenario 'visiting bookings/list shows a single booking after creating one booking' do
    create_two_users_and_one_space_and_one_booking
    visit('/login')
    # josh is the user who is making this booking
    fill_in('email', with: 'josh@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Log in")
    visit('/booking/yours')

    # space name
    expect(page).to have_content("Bob's space")
    # booking start date
    expect(page).to have_content("2020-12-13")
    # booking end date 
    expect(page).to have_content("2020-12-14")
  end

  scenario 'visiting bookings/list shows a bookings list after creating two bookings' do
    create_three_users_and_two_spaces_and_two_bookings
    visit('/login')
    # josh is the user who is making this booking
    fill_in('email', with: 'josh@wemail.com')
    fill_in('password', with: 'secretpassword')
    click_button("Log in")
    visit('/booking/yours')

    # space1 details
    expect(page).to have_content("Bob's space")
    expect(page).to have_content("2020-12-13")
    expect(page).to have_content("2020-12-14")

    # space2 details
    expect(page).to have_content("Ed's space")
    expect(page).to have_content("2020-07-20")
    expect(page).to have_content("2020-07-21")
  end
end