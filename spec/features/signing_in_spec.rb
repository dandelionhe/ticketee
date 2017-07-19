require "rails_helper"
RSpec.feature 'Users can sign in' do
	let!(:user) {FactoryGirl.create(:user)  }

	scenario 'with valid credentails' do
	  visit '/'
		click_link 'Log in'
		fill_in 'Email',with:user.email
		fill_in 'Password',with:'foobar'
		click_button 'Log in'

		expect(page).to have_content 'Signed in successfully'

	end
	scenario 'unless they are archived' do
		user.archive

		visit '/'
		click_link 'Log in'
		fill_in 'Email',with:user.email
		fill_in 'Password',with:'foobar'
		click_button 'Log in'

		expect(page).to have_content 'Your account has been archived.'

	end
end
