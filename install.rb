puts "** Installing Server Response Time plugin..."
FileUtils.mkdir_p File.join(Rails.root.to_s, File.dirname("/public/testing/server_response_time/assets"))
FileUtils.cp_r File.join(Rails.root.to_s, "/vendor/plugins/server_response_time/public"), File.join(Rails.root.to_s, "/public/testing/server_response_time/assets")
FileUtils.rm_rf(File.join(Rails.root.to_s, "/vendor/plugins/server_response_time/public"))
puts "** Successfully installed Server Response Time plugin..."
