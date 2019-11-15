describe "the signin process" do
    before :each do
      user=User.create(name: "Test", email: 'user@example.com')
    end
  
    it "signs me in" do
        
      visit '/login'
      within(".field") do
        fill_in 'Email', with: 'user@example.com'
      end
      click_button 'Log in'
      save_and_open_page
      expect(page).to have_content 'Logged in as user@example.com'
    end
  end
