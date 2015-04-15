require 'faker'

# Create Posts
50.times  do
	Post.create!(
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph
	)
end

if !Post.find_by(title: "Unique title here")
	Post.create!(
	title: "Unique title here",
	body: "Unique body here"
	)
end





posts = Post.all

# Create Comments
100.times do
	Comment.create!(
		post: posts.sample,
		body: Faker::Lorem.paragraph
	)
end

if !Comment.find_by(body: "Unique comment")
	Comment.create!(
		post: Post.all.sample,
		body: "Unique comment"
		)
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"