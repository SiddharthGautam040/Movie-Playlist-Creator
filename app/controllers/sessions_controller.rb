class SessionsController < ApplicationController
	before_action :user_in_session, only: [:new]
	def new
		@user = User.new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			reset_session
			log_in user
			redirect_to search_path
		else
			flash.now[:danger] = "Invalid email/password combination"
			render :new
		end
	end

	def destroy
		log_out
		flash[:success] = "Logged Out Successfuly"
		redirect_to login_path, status: 303
	end

end
