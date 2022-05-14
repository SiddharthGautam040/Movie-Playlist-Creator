module SessionsHelper
	require 'net/http'
	require 'json'
	def log_in(user)
		session[:user_id] = user.id
	end

	def user_now
		user = User.find_by(id: curr_user)
	end

	def curr_user
    session[:user_id]
  end

	def log_out
		reset_session
		session[:user_id] = nil
	end

	def logged_in
		if not curr_user
			flash[:danger] = "Please Login before"
			redirect_to login_path
		end
	end
end
