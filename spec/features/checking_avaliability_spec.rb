feature 'bookings must be available' do
    scenario "cant make a booking outside availability window" do
        sign_up_and_sign_in
        create_cottage_listing
        visit '/spaces/list'
        click_button 'More Details'
        fill_in("start_date", with:"2020-09-11")
        fill_in("end_date", with:"2020-09-11")
        click_button("Book Now")
        expect(page).to have_content("This booking is unavailable at this time.")
    end
end

