def sign_up
  visit('/')
  fill_in('email', with: 'josh@wemail.com')
  fill_in('password', with: 'secretpassword')
  click_button("Sign up")
end

def create_cottage_listing
  visit('/listings/create')
  fill_in "name_field", with: "Cute ass cottage"
  fill_in "desc_field", with: "This cottage is deadass so cute"
  fill_in "price_field", with: "69"
  click_button("Add Listing")
end
