require "rails_helper"
RSpec.feature 'An admin can archive users' do
	let(:admin_user) { FactoryGirl.create(:user,:admin) }
	let(:user){FactoryGirl.create(:user)}
	before do
	  login_as(admin_user)
	end

	scenario 'successfully' do
		visit admin_user_path(user)
		click_link 'Archive User'

		expect(page).to have_content 'User has been archived.'
		expect(page).to_not have_content user.email
	end

	scenario 'cant archive himself' do
	  visit admin_user_path(admin_user)
		click_link 'Archive User'

		expect(page).to have_content 'You cant archive yourself.'
	end
end
