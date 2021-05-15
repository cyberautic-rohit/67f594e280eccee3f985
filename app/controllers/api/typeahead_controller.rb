class Api::TypeaheadController < ApplicationController
	def user_search
		users = User.where("lower(email) LIKE ? OR lower(lastName) LIKE ? OR lower(firstName) LIKE ?", "%#{params[:input].downcase}%", "%#{params[:input].downcase}%", "%#{params[:input].downcase}%")
		if users.present?
			render json: {users: {data: users}}, status: 200
		else
			render json: {message: "match not found", status: 200}
		end
	end
end
