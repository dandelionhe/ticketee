require "rails_helper"

RSpec.feature "User can view project" do
	let(:user ) { FactoryGirl.create(:user) }
	let(:project) { FactoryGirl.create(:project,name:'Sublime Text 3') }

	before do
		login_as(user)
		assign_role!(user,:viewer,project)
	end

	scenario 'with project details' do
	  visit '/'
		click_link 'Sublime Text 3'
		expect(page.current_url).to eq project_url(project)
	end
end
