FactoryGirl.define do
	factory :user do
		name "Douglas Adams"
		sequence(:email, 100) { |n| "person#{n}@example.com" }
		password "helloworld"
		password_confirmation "helloworld"
		confirmed_at Time.now

		factory :user_with_post_and_comment do
			title "Post Title"
			body "Post bodies must be pretty long."
			user
			topic { Topic.create(name: 'Topic name') }

			body "This is a new comment."
			user
			post

			after(:build) do |comment|
				comment.class.skip_callback(:create, :after, :send_favorite_emails)
			end
		end
	end
end