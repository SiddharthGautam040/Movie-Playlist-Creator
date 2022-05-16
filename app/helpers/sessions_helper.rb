module SessionsHelper
	
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

	def user_in_session
		if curr_user
			redirect_to user_now
		end
	end

	def is_param_user
		if params[:id].to_i != curr_user
			redirect_to user_now
		end
	end

	def is_curr_user_playlist
		playlist =  Playlist.find_by(id: params[:id], user_id: curr_user)
		if not playlist
			@delete_rights = false
		else
			@delete_rights = true
		end
	end

	def user_name(playlist)
    playlist_for = playlist.user_id
    User.find_by(id: playlist_for)
  end
end
