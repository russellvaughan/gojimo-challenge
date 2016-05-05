require 'rails_helper'

RSpec.describe QualificationsController, type: :controller do

	before :each do
		@qualification = create(:qualification)	
		data = "[{\"id\":\"04ec172d-0c8f-4c09-94b4-d797b9481171\",\"name\":\"ASVAB\",
		\"subjects\":[{\"id\":\"1\",\"title\":\"Math\",\"colour\":\"Red\"}]  }]"
		stub_request(:get, 'https://api.gojimo.net/api/v4/qualifications').
		with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
		to_return(status: 200, body: data, headers: {})
	end

	describe "GET #index" do 
		it 'renders all tasks' do 
			get :index
			expect(assigns(:qualifications)).to eq([@qualification])
		end
	end

	describe "GET #show" do 
		it "should show specific qualification" do
			get :show, id: @qualification
			assert_response :success
		end

  	it "assigns the requested contact to @contact" do
    get :show, id: @qualification
    expect(assigns(:qualification)).to eq(@qualification)
  	end

	end

end