require "rails_helper"

RSpec.feature 'Users can create new ticket' do
	let!(:user) {FactoryGirl.create(:user)  }
	before do
		login_as(user)
	  project = FactoryGirl.create(:project,name:'Internet Explorer')
		assign_role!(user,:viewer,project)

		visit project_path(project)
		click_link 'New Ticket'
	end

	scenario 'with valid attributes' do
	  fill_in 'Name',with:'Non-standands compliance'
		fill_in 'Description',with:'My pages are ugly!'
		click_button 'Create Ticket'

		expect(page).to have_content 'Ticket has been created.'
		within('#ticket') do
			expect(page).to have_content "Author: #{user.email}"
		end
	end

	scenario 'when providing invalid attributes' do
		click_button 'Create Ticket'

		expect(page).to have_content 'Ticket has not been created.'
		expect(page).to have_content "Name can't be blank"
		expect(page).to have_content "Description can't be blank"
	end

	scenario 'with invalid description' do
	  fill_in 'Name',with:'Non-standands compliance'
		fill_in 'Description',with:'it sucks!'
		click_button 'Create Ticket'

		expect(page).to have_content 'Ticket has not been created.'
		expect(page).to have_content 'Description is too short'
	end


end
