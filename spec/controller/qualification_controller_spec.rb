require 'rails_helper'

RSpec.describe QualificationsController, type: :controller do

	before :each do
		@qualification = create(:qualification)
	end

	describe "GET #index" do 
		it 'renders all tasks' do 
			get :index
			expect(assigns(:qualifications)).to eq([@qualification])
		end
	end

end