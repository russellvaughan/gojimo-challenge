describe Api do

	subject(:api) { described_class.new() }

	before(:each) do
		stub_request(:get, 'https://api.gojimo.net/api/v4/qualifications').
		with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
		to_return(status: 200, body: '{"qualification": [{"name": "SAT", "location": "Harbor"}]}', headers: {})
	end

	describe '#fetch' do 
		it 'pulls data from a remote api' do 
			expect(api.fetch).to include("qualification")
		end
	end

	before(:each) do
		allow(api).to receive(:data) {[{"id"=>"04ec172d-0c8f-4c09-94b4-d797b9481171", "name"=>"ASVAB", "subjects"=>[{"title" => "Math", "colour" => "Red", "id" => "1"}] }]}
	end

	describe '#persist_data' do 
		it 'saves fetched qualifications to the database' do 
			expect{api.persist_data}.to change(Qualification, :count).by(1)
		end

		it 'only saves unique qualifications to the database' do 
			create(:qualification)
			expect{api.persist_data}.to change(Qualification, :count).by(0)
		end
	end

	describe '#persist_data' do 
		it 'saves fetched subjects to the database' do 
			expect{api.persist_data}.to change(Subject, :count).by(1)
		end

		it 'only saves unique subjects to the database' do 
			create(:subject)
			expect{api.persist_data}.to change(Subject, :count).by(0)
		end

	end
	
	
end