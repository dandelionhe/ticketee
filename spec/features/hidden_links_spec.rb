require "rails_helper"
RSpec.feature 'Users can only see appropriate links' do
	let(:project) { FactoryGirl.create(:project) }
	let(:user) {FactoryGirl.create(:user)  }
	let(:admin) { FactoryGirl.create(:user,:admin) }



	context 'non admin users' do
		before	do
			login_as(user)
			assign_role!(user,:viewer,project)
		end

		scenario 'cant see new project link' do
		  visit '/'
			expect(page).to_not have_link 'New Project'
		end

		scenario 'cant see the delete link' do
			visit project_path(project)
			expect(page).to_not have_link 'Delete Project'
		end

	end

	context 'admin user' do
		before{login_as(admin)}
		scenario 'can see the new project link' do
			visit '/'
			expect(page).to have_link 'New Project'
		end
		scenario 'can see the delete link' do
			visit project_path(project)
			expect(page).to have_link 'Delete Project'
		end

	end
end
