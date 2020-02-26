feature 'make a booking' do
    scenario 'user wants to book a night ' do
        Users.create(email: "bilbo@baggins.com", password: "bilbo")
        Spaces.create(title: "Nice Place", description: "very nice", price_per_night: "67")
        sign_up_and_sign_in
        click_button("More Details")
        fill_in("booking", with:"11/03/20")
        click_button("Book Now")
        expect(page).to have_content("Booking Successful")      
    end
  end
  