def sign_up
  visit('/')
  fill_in('email', with: 'josh@wemail.com')
  fill_in('password', with: 'secretpassword')
  click_button("Sign up")
end