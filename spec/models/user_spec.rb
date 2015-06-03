require 'rails_helper'

describe User do

	include TestFactories

	describe "#favorited(post)" do

		before do
			@post = associated_post
			@user = authenticated_user
		end
		

		it "returns 'nil if the user has not favorited the post" do
			expect(@user.favorited(@post)).to be_nil
		end

		it "returns the appropriate favorite if it exists" do
			favorite = @user.favorites.where(post: @post).create
			expect(@user.favorited(@post)).to eq(favorite)
		end

		it "returns 'nil' if the user has favorited another post" do
			expect(@user.favorited(@post)).to be_nil
		end 
	end

	describe ".top_rated" do

		before do
			@user1 = create(:user_with_post_and_comment)
			# @user1 = create(:user)
			# post = create(:post, user: @user1)
			# create(:comment, user: @user1, post: post)

			@user2 = create(:user_with_post_and_comment)
			# post = create(:post, user: @user2)
			# 2.times { create(:comment, user: @user2, post: post) }
		end

		fit "returns users ordered by comments + posts" do
			expect( User.top_rated.first ).to eq(@user1)
		end

		it "stores a 'posts_count' on user" do
			users = User.top_rated
			expect( users.first.posts_count ).to eq(1)
		end

		it "stores a 'comments_count' on user" do
			users = User.top_rated
			expect( users.first.comments_count ).to eq(2)
		end
	end
end