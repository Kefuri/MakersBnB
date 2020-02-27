require 'spec_helper'

feature "a user should not be able to book dates that are overlapping other bookings" do
  scenario "User cannot book because there is a booking that started before but ends in the user's booking period" do
    Spaces.create(id: "696969", title: "Nice Place", description: "very nice", price_per_night: "67")
    Bookings.create(start_date: "2020-03-09", end_date: "2020-03-14", spaces_id:"696969")
    sign_up_and_sign_in
    click_button("More Details")
    fill_in("start_date", with:"2020-03-11")
    fill_in("end_date", with:"2020-03-15")
    click_button("Book Now")
    expect(page).to have_content("This booking is unavailable due to a conflicting booking.")
  end

  scenario "User cannot book because there is a booking that starts and ends in their booking period" do
    Spaces.create(id: "696969", title: "Nice Place", description: "very nice", price_per_night: "67")
    Bookings.create(start_date: "2020-03-12", end_date: "2020-03-14", spaces_id:"696969")
    sign_up_and_sign_in
    click_button("More Details")
    fill_in("start_date", with:"2020-03-11")
    fill_in("end_date", with:"2020-03-15")
    click_button("Book Now")
    expect(page).to have_content("This booking is unavailable due to a conflicting booking.")
  end

  scenario "User cannot book because there is a booking that starts within the booking period" do
    Spaces.create(id: "696969", title: "Nice Place", description: "very nice", price_per_night: "67")
    Bookings.create(start_date: "2020-03-12", end_date: "2020-03-17", spaces_id:"696969")
    sign_up_and_sign_in
    click_button("More Details")
    fill_in("start_date", with:"2020-03-11")
    fill_in("end_date", with:"2020-03-15")
    click_button("Book Now")
    expect(page).to have_content("This booking is unavailable due to a conflicting booking.")
  end

  scenario "user cannot book because there is a booking that encompasses their own" do
    Spaces.create(id: "696969", title: "Nice Place", description: "very nice", price_per_night: "67")
    Bookings.create(start_date: "2020-03-09", end_date: "2020-03-17", spaces_id:"696969")
    sign_up_and_sign_in
    click_button("More Details")
    fill_in("start_date", with:"2020-03-11")
    fill_in("end_date", with:"2020-03-15")
    click_button("Book Now")
    expect(page).to have_content("This booking is unavailable due to a conflicting booking.")
  end
end

