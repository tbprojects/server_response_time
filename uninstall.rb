puts "** Uninstalling Server Response Time plugin...."
FileUtils.rm_rf(File.join(Rails.root.to_s, "/public/testing/server_response_time"))
