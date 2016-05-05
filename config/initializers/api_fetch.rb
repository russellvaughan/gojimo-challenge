	api = Api.new
	api.fetch_data
	@qualifications = Qualification.all