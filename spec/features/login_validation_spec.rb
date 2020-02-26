feature 'Login validation' do
  scenario 'A non-logged in user cannot visit listings page' do
    visit('/spaces/list')
    expect(current_path).to eq('/login')
  end
end
