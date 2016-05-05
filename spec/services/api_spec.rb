describe Api do

	subject(:api) { described_class.new() }

	before(:each) do
		data = "[{\"id\":\"04ec172d-0c8f-4c09-94b4-d797b9481171\",\"name\":\"ASVAB\",
		\"subjects\":[{\"id\":\"1\",\"title\":\"Math\",\"colour\":\"Red\"}]  }]"
		stub_request(:get, 'https://api.gojimo.net/api/v4/qualifications').
		with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
		to_return(status: 200, body: data, headers: {})
	end

	describe '#fetch data' do
		it "pulls and stores data from a remote api" do
			expect {api.fetch_data}.to change {[Qualification.count, Subject.count]}.by([1,1])
    end
	end 


	describe '#fetch_from_api' do 
		it 'pulls data from a remote api' do 
			response = [{"id"=>"04ec172d-0c8f-4c09-94b4-d797b9481171", "name"=>"ASVAB", 
			"subjects"=>[{"id"=>"1", "title"=>"Math", "colour"=>"Red"}]}]
			expect(api.fetch_from_api).to eq(response)
		end
	end


	describe '#persist_data' do 
		it 'saves fetched qualifications to the database' do 
			api.fetch_from_api
			expect{api.persist_data}.to change(Qualification, :count).by(1)
		end

		it 'only saves unique qualifications to the database' do 
			create(:qualification)
			api.fetch_from_api
			expect{api.persist_data}.to change(Qualification, :count).by(0)
		end

		it 'saves fetched subjects to the database' do 
			api.fetch_from_api
			expect{api.persist_data}.to change(Subject, :count).by(1)
		end

		it 'only saves unique subjects to the database' do 
			create(:subject)
			api.fetch_from_api
			expect{api.persist_data}.to change(Subject, :count).by(0)
		end

	end
	
	
end