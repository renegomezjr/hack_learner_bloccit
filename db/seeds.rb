include RandomData

50.times do

  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by!(
  title: "Hello this time",
  body: "This is the time of our lives. Don't stop till you get enough.
  This is the big one.  I really like to cha-cha.")

Comment.find_or_create_by!(
  body: "This is a unique comment.  I like the unique post.
  It helps me do my work.  Give me hope.")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
