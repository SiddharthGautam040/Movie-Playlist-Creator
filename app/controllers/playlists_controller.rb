class PlaylistsController < ApplicationController
	before_action :logged_in, only: [:new, :create, :show, :destroy]
	before_action :is_curr_user_playlist, only: [:show] 

	def new
		@playlist = Playlist.new()
	end

	def create
		@playlist = Playlist.new(playlist_params)
		@playlist.user_id = session[:user_id]
		if @playlist.save
			flash[:success] = "Playlist Created"
			redirect_to user_now
		else
			@user = user_now
			render :new
		end
	end

	def destroy
		@playlist = Playlist.find_by(id: params[:id], user_id: curr_user)
		if @playlist
			items = Listitem.where(playlist_id: params[:id])
			items.destroy_all
			@playlist.destroy()
			redirect_to user_now
		else
		redirect_to user_now
		end
	end

	def show
		@playlist_items = Listitem.where(playlist_id: params[:id])
		@playlist = Playlist.find_by(id: params[:id])
		if @playlist.is_public == "0" && @playlist.user_id != curr_user
			@playlist = nil
		end
		@user = user_now
		if @playlist == nil
			flash[:danger] = "No Playlist exits at that path"
			redirect_to allplaylists_path
		end
	end

	private

	  def playlist_params
	    params.require(:playlist).permit(:title, :description, :is_public)
	  end
end
