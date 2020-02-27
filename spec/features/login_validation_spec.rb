feature 'Login validation' do
  scenario 'A non-logged in user cannot visit listings page' do
    cant_access_without_login = ['/spaces/list', '/spaces/create', '/spaces/confirm', '/spaces/yours', '/logout'].sample
    visit(cant_access_without_login)
    expect(current_path).to eq('/login')
  end
end
