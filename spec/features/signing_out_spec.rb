require "rails_helper"
RSpec.feature 'Signed in users can signed out' do
	let(:user) { FactoryGirl.create(:user) }
	before do
	  login_as(user)
	end

	scenario  do
	  visit '/'
		click_link 'Hi'
		click_link 'Log out'
		expect(page).to have_content 'Signed out successfully.'
	end
end