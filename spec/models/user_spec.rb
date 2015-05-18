require 'rails_helper'

describe User do

	include TestFactories

	describe "#favorited(post)" do

		before do
		@post = associated_post
		@user = authenticated_user
		

		xit "returns 'nil if the user has not favorited the post" do
			expect(@user.favorited(@post)).to be_nil
		end

		xit "returns the appropriate favorite if it exists" do
			favorite = @user.favorites.where(post: @post).create
			expect(@user.favorited(@post)).to eq(favorite)
		end

		it "returns 'nil' if the user has favorited another post" do
			expect(@user.favorited(@post) == @post).to be_nil
		end 
	end
end