# feature 'display all booking requests' do
#     scenario 'see all requests pending my approval' do
#         Users.create(id: "700", email: "bilbo@baggins.com", password: "bilbo")
#         Spaces.create(id: "600", title: "Nice Place", description: "very nice", price_per_night: "67", users_id: "700")
#         Availabilities.create(start_date: "2020-01-01", end_date: "2022-01-01", spaces_id: "600")
#         sign_up_and_sign_in
#         click_button("More Details")
#         fill_in("start_date", with:"2020-03-11")
#         fill_in("end_date", with:"2020-03-11")
#         click_button("Book Now")
#         expect(page).to have_content("Booking Successful")
#         visit '/login'
#         fill_in('email', with: "bilbo@baggins.com") 
#         fill_in('password', with: "bilbo")
#         click_link('Your Pending Requests')
#         expect(page).to have_content("Start Date: 2020-03-11")
#     end
# end
