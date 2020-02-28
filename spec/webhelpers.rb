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
  fill_in 'start_date', with: "2020-03-11"
  fill_in 'start_date', with: "2020-07-11"
  click_button("Add Listing")
end

def create_two_users_and_one_space_and_one_booking
  # user for space
  Users.create(email: 'bob@bob.com', password: 'password1', id: 68)
  # user for booking
  Users.create(email: 'josh@wemail.com', password: 'secretpassword', id: 69)

  # space belongs to bob
  Spaces.create(title: "Bob's space", description: "Bob's place", price_per_night: 123, users_id: 68, id: 12)

  # josh booking bob's space
  Bookings.create(start_date: '13/12/2020', end_date: '14/12/2020', users_id: 69, spaces_id: 12)
end

def create_three_users_and_two_spaces_and_two_bookings
  # users for space1, space2 and bookings (respectively)
  Users.create(email: 'bob@bob.com', password: 'password1', id: 1)
  Users.create(email: 'ed@ed.com', password: 'pa$$word1', id: 2)
  Users.create(email: 'josh@wemail.com', password: 'secretpassword', id: 3)

  # space1 belongs to bob
  Spaces.create(title: "Bob's space", description: "Bob's place", price_per_night: 123, users_id: 1, id: 10)

  # space2 belongs to Ed
  Spaces.create(title: "Ed's space", description: "Ed's place", price_per_night: 234, users_id: 2, id: 11)

  # josh booking Bob's space
  Bookings.create(start_date: '13/12/2020', end_date: '14/12/2020', users_id: 3, spaces_id: 10)

  # josh booking Ed's space
  Bookings.create(start_date: '20/07/2020', end_date: '21/07/2020', users_id: 3, spaces_id: 11)
end