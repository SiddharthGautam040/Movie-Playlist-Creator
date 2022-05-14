class PlaylistsController < ApplicationController
	before_action :logged_in, only: [:new, :create, :show, :destroy]
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
		@playlist = Playlist.find_by(id: params[:id])
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
		@user = user_now
	end

	private

	  def playlist_params
	    params.require(:playlist).permit(:title, :description)
	  end
end
