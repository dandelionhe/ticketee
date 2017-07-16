require "rails_helper"

RSpec.feature "User can view project" do
	before do

	end

	scenario 'with project details' do
		project = FactoryGirl.create(:project,name:'Sublime Text 3')

	  visit '/'
		click_link 'Sublime Text 3'
		expect(page.current_url).to eq project_url(project)
	end
end
