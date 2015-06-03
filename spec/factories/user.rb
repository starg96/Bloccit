FactoryGirl.define do
	factory :user do
		name "Douglas Adams"
		sequence(:email, 100) { |n| "person#{n}@example.com" }
		password "helloworld"
		password_confirmation "helloworld"
		confirmed_at Time.now

		factory :user_with_post_and_comment do
		
			# user
			# topic { Topic.create(name: 'Topic name') }

			# comments {Comment.create(body: "This is a new comment.")}
			# posts { Post.create(	title: "Post Title",
			# body: "Post bodies must be pretty long.")}

			# after(:build) do |comment|
			# 	comment.class.skip_callback(:create, :after, :send_favorite_emails)
			# end

			after(:create) do |user|
				post = Post.create(title: "Post Title", body: "Post bodies must be pretty long.", topic: Topic.create, user: user)

				Comment.create(body: "This is a new comment.", user: user, post: post)
			end
		end
	end
end