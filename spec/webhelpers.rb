def sign_up
  visit('/')
  fill_in('email', with: 'josh@wemail.com')
  fill_in('password', with: 'secretpassword')
  click_button("Sign up")
end

def sign_up_and_sign_in
  sign_up # as josh@wemail.com
  fill_in('email', with: 'josh@wemail.com')
  fill_in('password', with: 'secretpassword')
  click_button("Log in")
end

def create_cottage_listing
  visit('/spaces/create')
  fill_in "name_field", with: "Cute ass cottage"
  fill_in "desc_field", with: "This cottage is deadass so cute"
  fill_in "price_field", with: "69"
  click_button("Add Listing")
end

def create_users_and_space_and_booking
  # user for space
  Users.create(email: 'bob@bob.com', password: 'password1', id: 68)
  # user for booking
  Users.create(email: 'josh@wemail.com', password: 'secretpassword', id: 69)

  # space belongs to bob
  Spaces.create(title: "Bob's space", description: "Bob's place", price_per_night: 123, users_id: 68, id: 12)

  # josh booking bob's space
  Bookings.create(start_date: '01/01/20', end_date: '02/01/20', users_id: 69, spaces_id: 12)
end