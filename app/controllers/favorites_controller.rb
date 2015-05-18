class FavoritesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@favorite = current_user.favorites.build(post: @post)
		authorize @favorite

		if @favorite.save
			flash[:notice] = "Post has been favorited."
			redirect_to [@post.topic, @post]
		else
			flash[:error] = "There was an error with favoriting."
			redirect_to @post
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@favorite = current_user.favorites.find(params[:id])
		authorize @favorite
		
		if @favorite.destroy
			flash[:notice] = "Unfavoritng successfull."
			redirect_to [@post.topic, @post]
		else
			flash[:error] = "There was an error unforiting the post."
			redirect_to [@post.topic, @post]
		end
	end
end
