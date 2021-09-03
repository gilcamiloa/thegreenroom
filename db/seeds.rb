# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

User.destroy_all
Venue.destroy_all
Tour.destroy_all
Booking.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(User.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Tour.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Booking.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Venue.table_name)

puts "Creating 4 venue owners..."

user1 = User.create!(
  {
    email: Faker::Internet.email,
    password: 123456,
    is_band: false
  }
)

user2 = User.create!(
  {
    email: Faker::Internet.email,
    password: 123456,
    is_band: false
  }
)

user3 = User.create!(
  {
    email: Faker::Internet.email,
    password: 123456,
    is_band: false
  }
)

user4 = User.create!(
  {
    email: Faker::Internet.email,
    password: 123456,
    is_band: false
  }
)

puts "...each with 10 venues..."

venue = Venue.create!(
  {
    user: user1,
    name: 'KOKO',
    capacity: 1300,
    description: "Live, big-name indie, rock and dance music plus club nights in palatial former theatre.",
    address: "1A Camden High St, London NW1 7JE",
    latitude: 51.53490452347282,
    longitude: -0.1382036578297606,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user1,
    name: 'The Bullingdon',
    capacity: 300,
    description: "Old-school watering hole with a small stage showcasing indie bands, live DJs & stand-up comedy.",
    address: "162 Cowley Rd, Oxford OX4 1UE",
    latitude: 51.7474483340786,
    longitude: -1.2359198160312062,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user1,
    name: 'Scala',
    capacity: 750,
    description: "Eclectic live music and club night calendar in multi-purpose venue with 4 levels and 2 dance floors.",
    address: "275 Pentonville Rd, London N1 9NL",
    latitude: 55.18768314660566,
    longitude: -0.3732591234016423,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user1,
    name: 'The Victoria Dalston',
    capacity: 150,
    description: "No-nonsense venue for up-and-coming bands in old Victorian pub famous for letting it all hang out.",
    address: "451 Queensbridge Rd, London E8 3AS",
    latitude: 51.54588485537989,
    longitude: -0.06996883083933327,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user1,
    name: 'Oslo, Hackney',
    capacity: 350,
    description: "Live music venue in former railway station, for daytime snacks and an evening entertainment.",
    address: "1A Amhurst Rd, London E8 1LL",
    latitude: 51.54736732957592,
    longitude: -0.05549590373563647,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user1,
    name: 'Brudenell Social Club',
    capacity: 400,
    description: "Old working man's club with 1950s decor, hosting up and coming (and some surprisingly huge) bands.",
    address: "33 Queen's Rd, Burley, Leeds LS6 1NY",
    latitude: 53.81003702528193,
    longitude: -1.5707490019270212,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user1,
    name: 'The Purple Turtle',
    capacity: 150,
    description: "2-level nightspot with heated garden and table football, for live music and weekly club nights.",
    address: "9 Gun St, Reading RG1 2JR",
    latitude: 51.45418066156674,
    longitude: -0.9729059289974807,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user1,
    name: 'North Laine Brewhouse',
    capacity: 150,
    description: "A cavernous, white-tiled bar with industrial lamps and steel brewing tanks for craft beer.",
    address: "27 Gloucester Pl, Brighton BN1 4AA",
    latitude: 50.82706295255641,
    longitude: -0.13554771367841525,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user1,
    name: 'Patterns, Brighton',
    capacity: 350,
    description: "Patterns has firmly established itself both as a safe space for Brighton’s underground club culture and a small live music venue that punches above its weight.",
    address: "10 Marine Parade, Kemptown, Brighton BN2 1TL",
    latitude: 50.82021860797452,
    longitude: -0.13515515969852593,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user1,
    name: 'O2 Institute 3, Birmingham',
    capacity: 300,
    description: "Modern venue in historic building with 3 rooms staging live indie and dance music gigs.",
    address: "78 Digbeth, Birmingham B5 6DY",
    latitude: 52.47568897825162,
    longitude: -1.887434573137932,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user2,
    name: 'Exchange',
    capacity: 200,
    description: "Exchange opened it’s doors as a Live Music / Club Venue in August 2012. Since opening we have played host to a wide array of artists including The 1975, Haim, George Ezra, Rag n Bone Man, (the) Melvins, Four Tet, IDLES, Sleaford Mods and many more.",
    address: "72, 73 Old Market St, Bristol BS2 0EJ",
    latitude: 51.45579453763902,
    longitude: -2.5828166001624444,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user2,
    name: 'Clwb Ifor Bach',
    capacity: 300,
    description: "Rock club focuses on homegrown acts, with low key shows by big names, but also features dance music.",
    address: "11 Womanby St, Cardiff CF10 1BR",
    latitude: 51.48062752347235,
    longitude: -3.18141600200651,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user2,
    name: 'The Joiners',
    capacity: 200,
    description: "Intimate pub live music venue hosting eclectic programme of up-and-coming and established acts.",
    address: "141 St Mary St, Southampton SO14 1NS",
    latitude: 50.90468536022295,
    longitude: -1.3965709173657035,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user2,
    name: 'The Adrian Flux Waterfront',
    capacity: 200,
    description: "All-standing, riverside nightclub and live music venue run by the student union with regular gigs.",
    address: "139-141 King St, Norwich NR1 1QH",
    latitude: 52.624821537012174,
    longitude: 1.3026603691971537,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user2,
    name: 'Rock City',
    capacity: 1900,
    description: "Popular independent stage for up-and-coming bands, including many student gigs and club nights.",
    address: "8 Talbot St, Nottingham NG1 5GG",
    latitude: 52.95604063713111,
    longitude: -1.1535966307914982,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user2,
    name: 'Exeter Phoenix',
    capacity: 510,
    description: "Multi-use arts venue with film and gig auditorium, gallery spaces, recording studio and a cafe-bar.",
    address: "Gandy St, Exeter EX4 3LS",
    latitude: 50.72534481503743,
    longitude: -3.531417002031701,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user2,
    name: 'Engine Rooms',
    capacity: 400,
    description: "Entertainment hub with roller disco for adults and kids, dance lessons, club nights and live bands.",
    address: "West Quay Road Industrial Estate, W Quay Rd, Southampton SO15 1GZ",
    latitude: 50.901424803942824,
    longitude: -1.4116488731908534,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user2,
    name: 'O2 Academy 2, Newcastle',
    capacity: 380,
    description: "Live music venue in refurbished bingo hall, hosting rock and pop acts and weekly club nights.",
    address: "Westgate Rd, Newcastle upon Tyne NE1 1SW",
    latitude: 54.97059934686987,
    longitude: -1.618745688391332,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user2,
    name: 'Queen Margaret Union',
    capacity: 900,
    description: "Student Union for QMU, hosting live music nights and entertainment throughout the week.",
    address: "22 University Gardens, Glasgow G12 8QN",
    latitude: 55.87375869587255,
    longitude: -4.291309671174321,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user2,
    name: 'Plug',
    capacity: 350,
    description: "3-room nightspot hosting diverse programme of live music and weekly club nights.",
    address: "14-16 Matilda St, Sheffield City Centre, Sheffield S1 4QD",
    latitude: 53.3767839897077,
    longitude: -1.4715925731070467,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user3,
    name: 'The Welly',
    capacity: 350,
    description: "Club nights and gigs in a sumptuous ballroom, intimate lounge or alternative upstairs space.",
    address: "105-107 Beverley Rd, Hull HU3 1TS",
    latitude: 53.753786850106216,
    longitude: -0.3484825098892205,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user3,
    name: 'Stylus',
    capacity: 150,
    description: "The clubbing component of Leeds University's Union building, hosting live and DJ'd music events.",
    address: "Leeds University Union, Lifton Pl, Woodhouse, Leeds LS2 9JT",
    latitude: 53.80680735442232,
    longitude: -1.5559541884321146,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user3,
    name: 'O2 Forum Kentish Town',
    capacity: 2300,
    description: "Eclectic programme of major live bands and club nights in former art deco cinema.",
    address: "9-17 Highgate Rd, London NW5 1JY",
    latitude: 51.55233707474113,
    longitude: -0.14192608666418235,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user3,
    name: 'Heaven',
    capacity: 1000,
    description: "Long-running gay nightclub in vaulted Charing Cross cellars hosting big weekly scene parties.",
    address: "9, The Arches, Villiers St, London WC2N 6NG",
    latitude: 51.51004639175116,
    longitude: -0.12402377544232435,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user3,
    name: 'Sindecombe Social',
    capacity: 300,
    description: "Smart bar with plates displayed on exposed brickwork, hanging lamps plus craft beers and pub grub.",
    address: "2 Goldhawk Rd, London W12 8QD",
    latitude: 51.50337336871057,
    longitude: -0.2239038155007984,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user3,
    name: 'OMEARA',
    capacity: 320,
    description: "A new home for live music, creative events and clubnights in London Bridge's refreshed railway arches.",
    address: "6 O'Meara St, London SE1 1TE",
    latitude: 51.50435367015925,
    longitude: -0.09448616728061174,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user3,
    name: 'The Deaf Institute',
    capacity: 260,
    description: "Landmark building housing plush basement bar, cafe/bar and upstairs music hall with smoking terrace.",
    address: "135 Grosvenor St, Manchester M1 7HE",
    latitude: 53.47035634949944,
    longitude: -2.236535859608777,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user3,
    name: 'Think Tank?',
    capacity: 200,
    description: "To date, the venue has hosted many notable acts. Bands and artists such as Wolf Alice, The 1975, Sam Fender, Peace, Drenge and Royal Blood have cut their teeth at the venue when first starting out.",
    address: "Times Square, Newcastle upon Tyne NE1 4EP",
    latitude: 54.96783729038183,
    longitude: -1.6205929865464848,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user3,
    name: 'La Belle Angele',
    capacity: 190,
    description: "Longstanding nightclub was renovated after a fire & hosts a range of varied DJ nights & live music events.",
    address: "11 Hastie's Cl, Edinburgh EH1 1HJ",
    latitude: 55.94875536694201,
    longitude: -3.187539615346592,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user3,
    name: 'The Bodega',
    capacity: 220,
    description: "Venue for gigs by rising musicians, nightclub with themed music nights and bar with a beer garden.",
    address: "23 Pelham St, Nottingham NG1 2ED",
    latitude: 52.953838035800956,
    longitude: -1.1459592019566012,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user4,
    name: 'The Sunflower Lounge',
    capacity: 120,
    description: "The Sunflower Lounge brings the glamour and grunge of New York dive bars to the centre of Birmingham. We have showcased the best of underground, breaking and local talent, with intimate performances from the likes of Peace, The Amazons, Foals, Wolf Alice, Royal Blood, Dua Lipa, Rat Boy, Superfood and many more...",
    address: "76 Smallbrook Queensway, Birmingham B5 4EG",
    latitude: 52.4762841977671,
    longitude: -1.8975974461478475,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user4,
    name: 'The Cookie',
    capacity: 180,
    description: "Coffee bar by day, turns into an arty bar scene by night with live music and comedy in cellar.",
    address: "68 High St, Leicester LE1 5YP",
    latitude: 52.63560429208377,
    longitude: -1.136956230802454,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user4,
    name: 'The Louisiana',
    capacity: 130,
    description: "Live bands nightly in a cosy room above a sprawling wood-floored pub and former seafarers' hotel.",
    address: "Wapping Rd, Bathurst Terrace, Bristol BS1 6UA",
    latitude: 51.44684002605702,
    longitude: -2.59642018851261,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user4,
    name: 'The Hope & Ruin',
    capacity: 140,
    description: "Lively, laid-back pub with reclaimed vibe, for craft beers and live bands in upstairs music space.",
    address: "11-12 Queens Rd, Brighton BN1 3WA",
    latitude: 50.824853862268064,
    longitude: -0.14304914251348885,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user4,
    name: "O2 Shepherd's Bush Empire",
    capacity: 2000,
    description: "Landmark live music venue in Edwardian theatre, hosting eclectic programme of rock, pop and comedy.",
    address: "Shepherd's Bush Green, London W12 8TT",
    latitude: 51.50367021627186,
    longitude: -0.22410578471350484,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user4,
    name: 'Buyers Club',
    capacity: 250,
    description: "Hip locale & event space with a verdant terrace offering craft ales, cocktails, wine & small plates.",
    address: "24 Hardman St, Liverpool L1 9AX",
    latitude: 53.40156738754962,
    longitude: -2.97128394427121,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user4,
    name: "King Tut's Wah Wah Hut",
    capacity: 300,
    description: "Mighty concert room for up-and-coming local bands and cult international acts serving own lager.",
    address: "272A St Vincent St, Glasgow G2 5RL",
    latitude: 55.86274337556175,
    longitude: -4.264929900009697,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user4,
    name: 'The Cluny 2',
    capacity: 270,
    description: "Iconic Newcastle music venue, bar, & kitchen. Independent since 2017.",
    address: "36 Lime St, Newcastle upon Tyne NE1 2PQ",
    latitude: 54.97526166989169,
    longitude: -1.5918610902361037,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user4,
    name: 'YES',
    capacity: 270,
    description: "Four floors of YES. A quirky, cool venue with all the mod-cons required of a live music venue.",
    address: "38 Charles St, Manchester M1 7DB",
    latitude: 53.4740577581536,
    longitude: -2.2381731864789307,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

venue = Venue.create!(
  {
    user: user4,
    name: 'Thekla',
    capacity: 400,
    description: "Live music and club nights on two floors of a large moored boat with a Banksy graffiti on the hull.",
    address: "The Grove, East Mud Dock, Bristol BS1 4RB",
    latitude: 51.44910333342838,
    longitude: -2.5942372750175253,
    available_dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 6), Faker::Date.forward(days: 12)]
  }
)

file1 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island4.jpg')
file2 = URI.open('http://www.koko.uk.com/sites/koko.uk.com/files/images/listings/island5.jpg')
venue.photos.attach(io: file1, filename: 'island4.jpg', content_type: 'image/jpg')
venue.photos.attach(io: file2, filename: 'island5.jpg', content_type: 'image/jpg')

10.times do
  Tour.create!(
    {
      user: [user1, user2, user3, user4].sample,
      name: Faker::Hipster.sentence(word_count: 3),
      start_date: Faker::Date.forward(days: 2),
      end_date: Faker::Date.forward(days: 9)
    }
  )
end

puts "Finished seeding #{Venue.count} venues!"

puts "Creating the test venue owner..."

User.create!(
  {
    email: 'demo@venue.com',
    password: 123123,
    is_band: false
  }
)

User.create!(
  {
    email: 'demoband@venue.com',
    password: 123123,
    is_band: true
  }
)

10.times do
  Booking.create!(
    {
      venue: Venue.all.sample,
      user: User.all.sample,
      dates: [Faker::Date.forward(days: 3), Faker::Date.forward(days: 5), Faker::Date.forward(days: 12)],
      tour: Tour.all.sample
    }
  )
end
puts "Seed complete 🤘"
