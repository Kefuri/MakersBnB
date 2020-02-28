feature 'make a booking' do
    scenario 'user wants to book a night ' do
        Users.create(email: "bilbo@baggins.com", password: "bilbo")
        Spaces.create(id: "600", title: "Nice Place", description: "very nice", price_per_night: "67")
        Availabilities.create(start_date: "2020-01-01", end_date: "2022-01-01", spaces_id: "600")
        sign_up_and_sign_in
        click_button("More Details")
        fill_in("start_date", with:"2020-03-11")
        fill_in("end_date", with:"2020-03-11")
        click_button("Book Now")
        expect(page).to have_content("Booking Successful") 

    end
    scenario 'user wants to book 5 nights' do
        Users.create(email: "bilbo@baggins.com", password: "bilbo")
        Spaces.create(id: "600", title: "Nice Place", description: "very nice", price_per_night: "67")
        Availabilities.create(start_date: "2020-01-01", end_date: "2022-01-01", spaces_id: "600")
        sign_up_and_sign_in
        click_button("More Details")
        fill_in("start_date", with:"2020-03-11")
        fill_in("end_date", with:"2020-03-16")
        click_button("Book Now")
        expect(page).to have_content("Booking Successful")
        expect(page).to have_content("You booked Nice Place from 11/03/2020 to 16/03/2020")
    end
    scenario 'user tries to book a night which has already been booked' do
        Users.create(id: "700", email: "bilbo@baggins.com", password: "bilbo")
        Spaces.create(id: "600", title: "Nice Place", description: "very nice", price_per_night: "67", users_id: "700")
        Availabilities.create(start_date: "2020-01-01", end_date: "2022-01-01", spaces_id: "600")
        sign_up_and_sign_in
        click_button("More Details")
        fill_in("start_date", with:"2020-03-11")
        fill_in("end_date", with:"2020-03-11")
        click_button("Book Now")
        expect(page).to have_content("Booking Successful")
        visit('/spaces/list')
        click_button("More Details")
        fill_in("start_date", with:"2020-03-11")
        fill_in("end_date", with:"2020-03-11")
        click_button("Book Now")
        expect(page).to have_content("This booking is unavailable at this time.")
    end
  end
  