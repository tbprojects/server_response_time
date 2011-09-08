require 'server_response_time_application_controller'
ActionController::Base.send :include, ServerResponseTimeApplicationController
ActionController::Base.send :before_filter, :log_start_time
ActionController::Base.send :after_filter, :log_end_time