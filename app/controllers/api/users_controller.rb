class Api::UsersController < ApplicationController
	before_action :check_user, only: [:show, :update, :destroy]
	def index
		users = User.all.paginate(page: params[:page], per_page: 3)
		render json: {data: users, status: 200}
	end

	def show
		render json: {data: @user, status: 200}
	end

	def create
		user = User.new(user_params)
		if user.save
			render json: {data: user, status:200}
		else
			render json: { errors: user.errors.full_messages, status: 422}
		end
	end

	def update
		if @user.update(user_params)
			render json: {data: @user, status: 200}
		else
			render json: {errors: @user.errors.full_messages, status: 422}
		end
	end

	def destroy
		@user.destroy
		render json: {data: nil, message: "User has been deleted."}
	end


	private

	def user_params
		params.require(:user).permit(:firstName, :lastName, :email)
	end

	def check_user
		@user = User.find(params[:id])
	end


end
