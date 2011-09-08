class Testing::ServerResponseTimesController < ActionController::Base
  layout '/testing/layouts/server_response_time'
  helper :all

  def index
    @server_response_times = ServerResponseTime.latest(10).reverse
  end
  
end
