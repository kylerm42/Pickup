#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




ActiveRecord::Base.transaction do
  # make one user first!

  u = User.first

  addresses = [
    "Mission Dolores Park, San Francisco",
    "Aquatic Park, San Francisco",
    "Union Square Park, San Francisco",
    "Yerba Buena Gardens, San Francisco",
    "Pink Triangle Park and Memorial, San Francisco",
    "San Francisco Botanical Garden, San Francisco",
    "Conservatory of Flowers, San Francisco",
    "Crissy Field, San Francisco",
    "Pioneer Park, San Fransico",
    "Ruby Skye, San Francisco",
    "The Broken Record, San Francisco",
    "Bourbon & Branch, San Francisco",
    "Double Dutch, 3192 16th St, San Francisco CA",
    "15 Romolo, San Francisco, CA",
    "Bar Agricole, San Francisco, CA",
    "1059 Hyde St, San Francisco, CA", "2025 Van Ness Ave, San Francisco, CA",
    "731 Market St, San Francisco, CA",
    "499 Haight St, San Francisco, CA",
    "1101 Market street, San Francisco, California",
    "377 32nd Ave, San Francisco, CA ",
    "581 Market St, San Francisco, CA",
    "445 Castro St, San Francisco, CA",
    "351 California St, San Francisco, CA",
    "157 Waverly Pl, San Francisco, CA",
    "701 Portola Dr, San Francisco, CA",
    "Dorado Terrace, San Francisco, CA",
    "344 Thomas L Berkley Way, Oakland, CA",
    "375 Gellert Blvd, Daly City, CA",
    "377 32nd Ave, San Francisco, CA",
    "4349 San Pablo Ave, Emeryville, CA",
    "5100 Broadway, Oakland, CA ‎",
    "931 Marina Village Pkwy, Alameda, CA",
    "10 Bayhill Shopping Center, San Bruno, CA"
  ]
  names = [
    "Frisbee in the park",
    "Let's look at dolphins!",
    "Need subs for frisbee game",
    "Looking for a few more for chess in the park",
    "Rap battling - good rappers only",
    "Soccer game",
    "Rugby game",
    "Soccer game",
    "Flag football - come play!",
    "Indoor soccer",
    "New soccer game",
    "Need more for poker game",
    "Want to play darts?",
    "Let's play pool",
    "Let's play soccer",
    "Anyone up for MTG?",
    "Let's LARP it up!",
    "Building a search party",
    "Building my deck",
    "Let's protest something!",
    "Pool at the bar by my house",
    "Need partner for pool game",
    "Let's go kayaking",
    "Let's go tagging",
    "Need more for Settlers",
    "Pair programming",
    "Need partner for pair programming",
    "Pair programming",
    "Starcraft II game",
    "I need more people for poker",
    "Catan",
    "Checkers - good players only",
    "Poker - low buy in, friendly",
    "I'll do whatever",
    "More frisbee",
    "Need arcade partner"
  ]

  deets = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sagittis pretium malesuada. Nullam interdum ultricies tempus. Nam luctus, tortor in vulputate fermentum, sapien risus pulvinar ante, id suscipit lorem libero id urna. Nullam neque felis, ullamcorper et aliquet nec, semper sed elit. Vestibulum sed consequat sem. Integer accumsan lobortis mauris vitae ultricies. Donec ac nibh id enim ornare adipiscing vitae et nunc. Nullam sit amet purus lacinia, placerat mauris vel, tempor nibh. Nam gravida cursus est, vitae rutrum nibh auctor id."

  def rand_date
    (rand(7)).days.from_now
  end

  def random_hour
    (rand_date + rand(9..20).hour + rand(0..60).minutes).to_datetime
  end

  hashes = []
  50.times do
    hashes << { address: addresses.shift, title: names.shift, creator_id: u.id, deets: deets, date: random_hour, people_needed: (rand(20) + 1) }
  end
  Event.create(hashes)
end