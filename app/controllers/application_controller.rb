class ApplicationController < ActionController::Base
	#TODO: This is a temp fix until we introduce device gem tokens (naveen)
	skip_before_action :verify_authenticity_token
end
