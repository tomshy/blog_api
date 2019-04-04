module Authenticatable
	include ActionController::HttpAuthentication::Basic::ControllerMethods
	def authenticate
		http_basic_authenticate_with name: 'user', password: 'secret', except: [:index,:show]	
	end
	
end