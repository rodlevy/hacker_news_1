users = <<-USERS
Muddy_Waters
Buddy_Guy
Nina_Simone
BB_King
Etta_James
Billie_Holiday
HowlinWolf
Madlyn Davis
Mattie Delaney
Little Buddy Doyle
Archie Edwards
Sleepy John Estes
William Ezell
Lucky Peterson
Jesse Fuller
USERS


urls = <<-URLS
http://www.houseofblues.com
http://www.greenmill.com
http://buddyguy.com
http://www.bluesfest.com
http://www.cityofchicago.org/city/en/depts/dca/supp_info/chicago_blues_festival.html
URLS

titles = <<-TITLES
How Curiosity Propelled Angelina Fabbro to be a Brilliant Newcomer of 2013
4 Of The Most Interesting And Important Takes On The NSA, Snowden, And The Future Of Privacy
If 6 Inch Prehistoric Bugs Can Survive For 80 Years You Can Learn To Code
Your student loan is really a loan
Daisy Chaining Fireworks And Learning to Code
TITLES

comments = <<-COMMENTS
The most coolest blog post will be written here. Yesterday.
Actually pop-up Carles hoodie letterpress 90's DIY, Pinterest tattooed. Single-origin coffee pickled helvetica, disrupt beard fixie wayfarers pop-up bicycle rights intelligentsia Schlitz Wes Anderson meh. Butcher cliche farm-to-table, lomo umami before they sold out cornhole literally pitchfork. Shoreditch artisan single-origin coffee Pinterest lo-fi, Marfa pour-over irony art party cardigan. Small batch trust fund food truck polaroid keytar pug, 90's mlkshk. Chambray skateboard High Life four loko McSweeney's. Aesthetic keytar mixtape, pork belly pitchfork wolf selfies kale chips.
Sriracha keytar bespoke McSweeney's, twee flannel +1. Organic meggings four loko vinyl swag. Gastropub flexitarian selvage, Schlitz before they sold out messenger bag Tonx selfies. Chambray shoreditch you probably haven't heard of them ugh. Letterpress scenester hoodie Echo Park Cosby sweater. Lomo sartorial semiotics sustainable, letterpress authentic master cleanse aesthetic banjo tattooed skateboard banh mi hashtag Echo Park stumptown. Kale chips small batch try-hard Schlitz, Portland ennui ugh mixtape Tonx readymade banjo squid pork belly.
Single-origin coffee tumblr jean shorts fashion axe salvia Carles, narwhal tote bag +1 Odd Future Austin before they sold out. Trust fund Banksy Truffaut, selvage gluten-free meggings umami PBR chambray hashtag. Synth cray biodiesel, mlkshk deep v keffiyeh bicycle rights meh cornhole 8-bit salvia. Mixtape banh mi Etsy DIY, cardigan hoodie actually ethical authentic freegan wolf raw denim yr blue bottle vegan. Marfa narwhal thundercats photo booth occupy, 90's art party Vice. Typewriter pork belly plaid irony organic fanny pack leggings deep v roof party. Twee sriracha Brooklyn tote bag sartorial.
Hashtag Godard church-key, pork belly cornhole selvage kogi small batch Bushwick. Stumptown narwhal ethnic, Tonx bitters gastropub pitchfork lomo kogi Etsy 8-bit selfies Terry Richardson. Bitters 8-bit Carles, Brooklyn synth McSweeney's Godard helvetica Cosby sweater tousled banh mi next level. Pug Etsy 90's Portland, butcher hoodie cred art party banh mi. Letterpress street art kitsch, gentrify 8-bit quinoa leggings master cleanse next level VHS ugh bicycle rights. Squid street art DIY, intelligentsia butcher hella vegan. Semiotics whatever freegan, banjo pop-up fanny pack typewriter thundercats meh tousled synth hoodie Schlitz.
Wafer chupa chups candy tart croissant muffin faworki jujubes. Fruitcake brownie gummi bears sweet roll. Icing ice cream jelly. Brownie marshmallow lollipop chocolate cake cotton candy apple pie tart jelly beans. Toffee icing croissant candy canes macaroon. Tiramisu chocolate cake sweet roll marzipan jelly-o sugar plum sweet roll toffee dessert. Oat cake jelly cotton candy faworki apple pie. Chocolate bar chocolate liquorice wafer. Wafer jujubes dessert danish.
COMMENTS

emails = <<-EMAILS
curious@george.com
dr@seuss.com
mauricesendak@wherethewildthings.are
bb@king.com
muddy@waters.com
buddy@guy.com
ninasimone@awesome.com
eric@clapton.com
EMAILS


user_seed = users.each_line.to_a
url_seed = urls.each_line.to_a
comments_seed = comments.each_line.to_a
title_seed = titles.each_line.to_a
email_seed = emails.each_line.to_a

30.times do
  cv = CommentVote.create(
    # when adding belongs to you add a few other methods
    # post returns a post object
    # post_id with is the integer that is referenced
    vote: ((-1..1).to_a).sample,
    comment_id: ((1..15).to_a).sample,
    user_id: ((1..15).to_a).sample,
    )
  end

  30.times do
  pv = PostVote.create(
    # when adding belongs to you add a few other methods
    # post returns a post object
    # post_id with is the integer that is referenced
    vote: ((-1..1).to_a).sample,
    post_id: ((1..15).to_a).sample,
    user_id: ((1..15).to_a).sample,
    )
  end


comments_seed.each do |t|
  comment = Comment.create(
    content: comments_seed.sample.strip
    )
  comment.user_id = ((1..15).to_a).sample
  comment.save
end

user_seed.each do |u|
  User.create(
    username: user_seed.sample.strip,
    email: email_seed.sample.strip
    )
end  

15.times do
  post = Post.create(
    title: title_seed.sample.strip,
    url: url_seed.sample.strip
    )
  post.comments << Comment.all.sample(4)  
  post.user_id = ((1..15).to_a).sample
  post.save
end

