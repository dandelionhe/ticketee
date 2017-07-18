require "rails_helper"
RSpec.feature 'Users can sign up' do
	scenario 'when proving valid details' do
	  visit '/'
		click_link 'Sign Up'
		fill_in 'Email',with:'eric@example.com'
		fill_in 'user_password',with:'foobar'
		fill_in 'Password confirmation',with:'foobar'
		click_button 'Sign up'

		expect(page).to have_content 'Welcome! You have signed up successfully.'

	end

end
