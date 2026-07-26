class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV["BASIC_AUTH_USER"], password: ENV["BASIC_AUTH_PASSWORD"] unless Rails.env.test?
end
