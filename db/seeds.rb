# USERS

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

puts "Created 2 categories..."


# BLACKLISTS

Blacklist.create(website_name: "Facebook", website_url: "http://www.facebook.com")
Blacklist.create(website_name: "Instagram", website_url: "http://www.instagram.com")
Blacklist.create(website_name: "Twitter", website_url: "http://www.twitter.com")
Blacklist.create(website_name: "BBC News", website_url: "https://www.bbc.co.uk/news")

puts "Created 4 blacklist websites..."


# Assign blacklist websites to users

# BlacklistUser.create(user: User.find(1), blacklist: Blacklist.find(1))
# BlacklistUser.create(user: User.find(2), blacklist: Blacklist.find(2))
# BlacklistUser.create(user: User.find(3), blacklist: Blacklist.find(3))
# BlacklistUser.create(user: User.find(4), blacklist: Blacklist.find(4))

# puts "Assigned blacklist websites to users..."

# FLASHCARDS

Flashcard.create(
  question: "How do you install gems you added to your Gemfile?",
  answer: "Kill any web server running (Ctrl + C). Run bundle install. Restart the Rails server with rails s",
  category: Category.find(1)
)

Flashcard.create(
  question: "How do you build a link to the homepage of a Rails app?",
  answer: "<%= link_to 'Home', root_path %>",
  category: Category.find(1)
)

Flashcard.create(
  question: "Which information does rails routes display?",
  answer: "rails routes show you a list of your routes with details:

Prefix is the rails path prefix of the associated route
Verb is the HTTP verb of the route
URI Pattern is the path of the route
Controller#Action are targeted controller and method",
  category: Category.find(1)
)

Flashcard.create(
  question: "What is the convention for variable names?",
  answer: "lowerCamelCase!

const name = ""Boris Paillard"";
const firstName = ""Boris"";

NB: That’s the same convention for functions.",
  category: Category.find(2)
)

Flashcard.create(
  question: "How do you iterate over an array in JS?",
  answer: "With forEach.
The JS equivalent of the ruby block is an anonymous function that takes the item it is iterating over as a parameter.

const beatles = [ ""john"", ""paul"", ""ringo"", ""george""];

beatles.forEach((beatle) => {
  console.log(beatle);
});

Reminder: the equivalent in ruby is:

beatles.each do |beatle|
  puts beatle
end",
  category: Category.find(2)
)

puts "Created 5 flashcards..."

puts "Seeding completed!"

