desc "refresh api data"
task :update_feed => :environment do
	puts "Updating feed..."
	api = Api.new
	api.fetch_data
	puts "done."
end

