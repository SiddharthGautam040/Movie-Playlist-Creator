class UsersController < ApplicationController
  before_action :logged_in, only: [:show, :searchapi, :search]
  before_action :user_in_session, only: [:new]
  before_action :is_param_user, only: [:show]
	def new
		@user = User.new
	end

	def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account Created"
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = user_now
    @playlists = Playlist.where(user_id: @user)
  end

  def searchapi
    movie_name = params[:query]
    if movie_name.blank?
      flash[:danger] = "Search can't be empty"
      redirect_to search_path
      return
    end
    @res = api_call(movie_name)
    if @res == nil
      redirect_to search_path
    elsif @res["Response"] == "False"
      flash[:danger] = "No Result Found"
      @list_item = Listitem.new()
      redirect_to search_path
    else
      @user = user_now
      render :search
    end
  end

  def search
    @user = user_now
  end

	private

	  def user_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

    def api_call(movie_name)
      movie_name = movie_name.split
      movie_name = movie_name.join('+')
      uri = URI("http://www.omdbapi.com/?t=#{movie_name}&apikey=88d1c166")
      begin
        response = Net::HTTP.get(uri)
        rescue Net::OpenTimeout
          flash[:danger] = "Oops! Seems like API is too busy try after sometime"
          return
        end
      JSON.parse(response)
    end

end
