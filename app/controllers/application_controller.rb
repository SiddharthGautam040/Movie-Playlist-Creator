class ApplicationController < ActionController::Base
	include SessionsHelper
	include ApplicationHelper
	private
    def login_user
      if not curr_user
        flash[:danger] = "Please Login First"
        redirect_to new_session_path
      end
    end
end
