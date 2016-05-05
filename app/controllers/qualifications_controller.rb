 class QualificationsController < ApplicationController

 def index
 	api = Api.new
 	@qualifications = Qualification.all
 end

end