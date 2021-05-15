class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
	rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
	def render_not_found(exception)
		render json: {message: "#{exception.model.constantize} Not found", status: 404 }
	end

end

