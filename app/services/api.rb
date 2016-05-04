require 'net/http'
require 'json'

class Api

	attr_reader :data

	URL = 'https://api.gojimo.net/api/v4/qualifications'

	def fetch
		uri = URI(URL)
		response = Net::HTTP.get(uri)
		data = JSON.parse(response)
	end

	def persist_data	
		data.map do |qualification| 
			@qualification = Qualification.find_or_create_by(name: qualification["name"])
			qualification["subjects"].map do |subject|
			Subject.create(title: subject["title"], colour: subject["colour"],
			qualification_id: @qualification.id, unique_id: subject["id"] )
		end
		end
	end
end