 class QualificationsController < ApplicationController

 def index
 	api = Api.new
 	api.fetch_data
 	@qualifications = Qualification.all
 end

 def show
 	@qualification = Qualification.find(params[:id])
 end

end