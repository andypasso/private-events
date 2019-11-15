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

describe "events creation process" do

  it "creates an event" do
    visit '/login'
    within(".field") do
      fill_in 'Email', with: 'user@example.com'
    end
    click_button 'Log in'
    click_link 'Event new'
      fill_in 'Date', with: Date.tomorrow
      fill_in 'Description', with: ' test envet test envet test envet '
    click_button 'Create Event'
    expect(page).to have_content 'Event was successfully created.'
  end
end
  describe "events attendance process" do

  it "attends an event" do
    visit '/login'
    within(".field") do
      fill_in 'Email', with: 'user@example.com'
    end
    click_button 'Log in'
    visit '/events'
    click_link 'Attend the event'
    click_link 'Show'
    expect(page).to have_content 'Test'
  end

end


