require "rails_helper"
RSpec.feature 'Admin can change details of user' do
	let(:admin_user ) { FactoryGirl.create(:user,:admin) }
	let(:user) { FactoryGirl.create(:user) }

	before do
	  login_as(admin_user)
		visit admin_user_path(user)
		click_link 'Edit User'

	end

	scenario 'with valid details' do
	  fill_in 'Email',with:'newguy@example.com'
		click_button 'Update User'

		expect(page).to have_content 'User has been updated.'
		expect(page).to have_content 'newguy@example.com'
		expect(page).to_not have_content user.email
	end

	
end
