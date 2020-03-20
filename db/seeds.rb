puts "Cleaning Database"

BlacklistUser.destroy_all
Plan.destroy_all
User.destroy_all
Flashcard.destroy_all
Category.destroy_all
Blacklist.destroy_all

User.create!(
  first_name: "Jonas",
  last_name: "Vanbuel",
  email: 'jonas.vanbuel@gmail.com',
  password: 'holdthatthought',
  password_confirmation: 'holdthatthought')

User.create!(
  first_name: "Jamie",
  last_name: "Reynolds",
  email: 'jamie.s.a.reynolds@gmail.com',
  password: 'holdthatthought',
  password_confirmation: 'holdthatthought')

User.create!(
  first_name: "Sophie",
  last_name: "Archer",
  email: 'hello@sophiearcher.co.uk',
  password: 'holdthatthought',
  password_confirmation: 'holdthatthought')

User.create!(
  first_name: "Tom",
  last_name: "Poulter",
  email: 'tom_poulter_02@hotmail.com',
  password: 'holdthatthought',
  password_confirmation: 'holdthatthought')


puts "Created 4 users..."


# CATEGORIES

Category.create(category: "Ruby on Rails")
Category.create(category: "JavaScript")
Category.create(category: "Front End")

puts "Created 3 categories..."


# BLACKLISTS

Blacklist.create(website_name: "facebook.com", website_url: "http://www.facebook.com", image_url: "facebook.png")
Blacklist.create(website_name: "instagram.com", website_url: "http://www.instagram.com", image_url: "instagram.png")
Blacklist.create(website_name: "twitter.com", website_url: "http://www.twitter.com", image_url: "twitter.png")

puts "Created 3 blacklists..."


# Assign blacklist websites to users

# BlacklistUser.create(user: User.first, blacklist: Blacklist.first)
# BlacklistUser.create(user: User.second, blacklist: Blacklist.second)
# BlacklistUser.create(user: User.find(3), blacklist: Blacklist.find(3))
# BlacklistUser.create(user: User.find(4), blacklist: Blacklist.find(4))

# puts "Assigned blacklist websites to users..."

# FLASHCARDS

# Flashcard.create(
#   question: "How do you install gems you added to your Gemfile?",
#   answer: "Kill any web server running (Ctrl + C). Run bundle install. Restart the Rails server with rails s",
#   category: Category.first
# )

# Flashcard.create(
#   question: "How do you build a link to the homepage of a Rails app?",
#   answer: "rails new MY_APP",
#   category: Category.first
# )

# Flashcard.create(
#   question: "What is the default local port used by rails server?",
#   answer: "3000, you can consult your app at localhost:3000",
#   category: Category.first
# )

# Flashcard.create(
#   question: "How do you install gems you added to your Gemfile?",
#   answer: "1 Kill any web server running (Ctrl + C)
#           2 Run bundle install
#           3 Restart the Rails server with rails s",
#   category: Category.first
# )

# Flashcard.create(
#   question: "How do you launch a local server with Rails?",
#   answer: "rails server",
#   category: Category.first
# )

# Flashcard.create(
#   question: "What is an action in Rails?",
#   answer: "An action is a controller’s method targeted by a route.",
#   category: Category.first
# )

# Flashcard.create(
#   question: "What is Rails?",
#   answer: "Rails is a fullstack framework designed for web-app development based on Ruby & MVC-structured.",
#   category: Category.first
# )

# Flashcard.create(
#   question: "What is the command allowing you to list your app’s routes with Rails?",
#   answer: "rails routes",
#   category: Category.first
# )

# Flashcard.create(
#   question: "How do you build the path to a page of a Rails app?",
#   answer: "contact_path",
#   category: Category.first
# )

# Flashcard.create(
#   question: "Where can you find information and rating about a gem?",
#   answer: "You can go to its GitHub repo and check stars, forks, contributors and last commit date. You can also go to rubygems.org to check stats.",
#   category: Category.first
# )

# Flashcard.create(
#   question: "Why are model validations so important?",
#   answer: "Validations protect your database from incomplete or invalid records and gives error messages to display back to the user.",
#   category: Category.first
# )

# Flashcard.create(
#   question: "How does the development of any new rails app start?",
#   answer: "<%= link_to 'Home', root_path %>",
#   category: Category.first
# )


# Flashcard.create(
#   question: "Which information does rails routes display?",
#   answer: "rails routes show you a list of your routes with details:

# Prefix is the rails path prefix of the associated route
# Verb is the HTTP verb of the route
# URI Pattern is the path of the route
# Controller#Action are targeted controller and method",
#   category: Category.first
# )

# Flashcard.create(
#   question: "What is the convention for variable names?",
#   answer: "lowerCamelCase!

# const name = ""Boris Paillard"";
# const firstName = ""Boris"";

# NB: That’s the same convention for functions.",
#   category: Category.second
# )

# Flashcard.create(
#   question: "How do you iterate over an array in JS?",
#   answer: "With forEach.
# The JS equivalent of the ruby block is an anonymous function that takes the item it is iterating over as a parameter.

# const beatles = [ ""john"", ""paul"", ""ringo"", ""george""];

# beatles.forEach((beatle) => {
#   console.log(beatle);
# });

# Reminder: the equivalent in ruby is:

# beatles.each do |beatle|
#   puts beatle
# end",
#   category: Category.second
# )

# Flashcard.create(
#   question: "In the HTML skeleton, which markup contains metas and which one contains page content?",
#   answer: "<head> markup contains metas which are read by the browser. <body> markup contains content which is displayed to the client by the browser.",
#   category: Category.third
# )

# Flashcard.create(
#   question: "How do you define a paragraph?",
#   answer: "<p>A paragraph</p>",
#   category: Category.third
# )

# Flashcard.create(
#   question: "How do you define the most important heading followed by the least important heading?",
#   answer: "<h1>Title 1</h1>
# <h6>Title 6</h6>",
#   category: Category.third
# )

# Flashcard.create(
#   question: "What are the four types of CSS units?",
#   answer: "Units can be absolute in px, relative to the parent element in %, relative to the viewport (window) height vh or width vw, or relative to the font size of the element in em.",
#   category: Category.third
# )

# Flashcard.create(
#   question: "What are the four types of CSS units?",
#   answer: "Units can be absolute in px, relative to the parent element in %, relative to the viewport (window) height vh or width vw, or relative to the font size of the element in em.",
#   category: Category.third
# )

# puts "Created 5 flashcards..."

# User.all.each do |user|
#   Flashcard.all.each do |flashcard|

#     FlashcardUser.create(user: user, flashcard: flashcard, completed: false)

#   end
# end

# puts "Adding flashcards to users"

# User.all.each do |user|
#   Blacklist.all.each do |blacklist|

#     BlacklistUser.create(user: user, blacklist: blacklist)

#   end
# end

puts "Adding blacklists to users"

puts "creating plans"

Plan.create(name: "Free Plan")
Plan.create(name: "Medium Plan")
Plan.create(name: "Full Plan")

puts "Seeding completed!"

