class ListItemsController < ApplicationController

	def add_list_item
		list_item = Listitem.new(title: params[:Title],year: params[:Year],released: params[:Released],runtime: params[:Runtime],genere: params[:Genere],writer: params[:Writer],actors: params[:Actors],plot: params[:Plot],language: params[:Language],awards: params[:Awards],poster: params[:Poster],imdb: params[:imdbRating],type: params[:type],total_seasons: params[:total_seasons],response: params[:response],playlist_id: params[:playlist])
		if list_item.save()
			playlist_name = update_time(params[:playlist])
			flash[:success] = params[:Title] + " added to " + playlist_name
			redirect_to user_now
		else
			if list_item.errors.any?
				flash[:danger] = list_item.errors.full_messages[0]
			end
			redirect_to search_path
		end
	end

	def destroy
		list_item = Listitem.find_by(id: params[:format])
		if list_item
			playlist = list_item.playlist_id
			update_time(list_item.playlist)
			list_item.destroy()
			redirect_to playlist_path(playlist)
		end
	end 

	private
		def update_time(playlist_id)
			playlist = Playlist.find_by(id: playlist_id)
			playlist.update(updated_at: Time.now())
			playlist.title
		end

end
