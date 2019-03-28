class ApplicationController < ActionController::API
	def authenticate
		return http_basic_authenticate_with name: 'user', password: 'secret'
	end	
end
