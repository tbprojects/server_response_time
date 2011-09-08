ActionController::Routing::Routes.draw do |map|
  map.namespace :testing do |test|
    test.resources :server_response_times, :only => [:index]
  end
end