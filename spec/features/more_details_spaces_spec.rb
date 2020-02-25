feature 'create a space' do
    scenario 'user enters a name, description and price for their space and sees their space' do
      sign_up_and_sign_in
      create_cottage_listing
      click_link("Back to spaces")
      click_button("More Details")
      expect(page).to have_content("Cute ass cottage")
      expect(page).to have_content("This cottage is deadass so cute")
      expect(page).to have_content("69")
    end
  end
  