# feature "approving a booking request" do
#     scenario 'user wants to book a night ' do
#         Users.create(email: "bilbo@baggins.com", password: "bilbo")
#         Spaces.create(title: "Nice Place", description: "very nice", price_per_night: "67")
#         sign_up_and_sign_in
#         click_button("More Details")
#         fill_in("start_date", with:"2020-03-11")
#         fill_in("end_date", with:"2020-03-11")
#         click_button("Book Now")
#         expect(page).to have_content("Booking Successful")
#         visit '/spaces/yours/requests'
#         expect(page).to have_content('1 Pending Request')
#     end
# end 