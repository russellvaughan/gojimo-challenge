require 'net/http'
require 'json'

class Api

	URL = 'https://api.gojimo.net/api/v4/qualifications'

	def fetch_data
		fetch_from_api
		persist_qualifications
		persist_subjects
	end

	def fetch_from_api
		uri = URI(URL)
		response = Net::HTTP.get(uri)
		@data = JSON.parse(response)
	end

	def persist_qualifications
		@data.map do |qualification| 
		@qualification = Qualification.find_or_create_by(name: qualification["name"])
		end
	end

	def persist_subjects
		@data.map do |qualification| 
			qualification["subjects"].map do |subject|
			Subject.create(title: subject["title"], colour: subject["colour"],
			qualification_id: @qualification.id, unique_id: subject["id"] )
			end
		end
	end
end