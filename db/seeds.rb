puts "Deleting..."
OrderItem.destroy_all
Order.destroy_all
Service.destroy_all
User.destroy_all

# Users
puts "Creating Users..."

client = User.create(
  first_name: 'Isabelle',
  last_name: 'Vallerand',
  email: 'client@gmail.com',
  password: '123456'
)
client_file = URI.open('https://res.cloudinary.com/dq1xs22hk/image/upload/v1645738596/profile/isabelle.jpg')
client.photo.attach(io: client_file, filename: 'isabelle.jpg', content_type: 'image/jpg')
puts client.first_name

seam1 = User.create(
  first_name: 'Rey',
  last_name: 'Kawakubo',
  bio: "I studied fashion design in Tokyo then I move to Montreal.
        Then I started to make wedding dresses and specialized in it.
        I put all of my efforts in the details and hopefully I can make YOUR wedding dress.",
  address: "25 Av. Fairmount Ouest Montreal QC H2T 2L9",
  email: 'seam1@gmail.com',
  password: '123456',
  seamstress: true
)
seam1_file = URI.open('https://res.cloudinary.com/dq1xs22hk/image/upload/v1645853245/seamstresses/rey.jpg')
seam1.photo.attach(io: seam1_file, filename: 'rey.jpg', content_type: 'image/jpg')
puts seam1.first_name

seam2 = User.create(
  first_name: 'Giuseppe',
  last_name: 'Paccini',
  bio: "I started working with my fatther in Little Italy and
        we had a lot of customers, I decided to keep the business in the family and
        to this day at 82 years old, I still fix and make suits and wedding dresses for the elite.",
  address: "206 Rue Bernard Ouest Montreal QC H2T 2K4",
  email: 'seam2@gmail.com',
  password: '123456',
  seamstress: true
)
seam2_file = URI.open('https://res.cloudinary.com/dq1xs22hk/image/upload/v1645846668/seamstresses/giuseppe.jpg')
seam2.photo.attach(io: seam2_file, filename: 'giuseppe.jpg', content_type: 'image/jpg')
puts seam2.first_name

seam3 = User.create(
  first_name: 'Andrea',
  last_name: 'Smith',
  bio: "I've studied Fashion Design in my early twenties
        and noticed right away how learning to sew has became helpful to me and others.
        I've worked for Gucci then decided to retire early and help my community instead.
        I offer high quality repairs at a reasonable price.",
  address: "4524 Boul. Saint-Laurent Montreal QC H2T 1R4",
  email: 'seam3@gmail.com',
  password: '123456',
  seamstress: true
)
seam3_file = URI.open('https://res.cloudinary.com/dq1xs22hk/image/upload/v1645852094/seamstresses/andrea.jpg')
seam3.photo.attach(io: seam3_file, filename: 'andrea.jpg', content_type: 'image/jpg')
puts seam3.first_name

seam4 = User.create(
  first_name: 'Yolanda',
  last_name: 'Fado',
  bio: "I am from Portugal and came here to work in the fashion industry, I specialize in leather and
        suede alterations as my mother was a shoe maker back in Portugal.
        For me, fixing leather and suede is a second nature.",
  address: "4631 Boul. Saint-Laurent Montreal QC H2T 1R2",
  email: 'seam4@gmail.com',
  password: '123456',
  seamstress: true
)
seam4_file = URI.open('https://res.cloudinary.com/dq1xs22hk/image/upload/v1645846471/seamstresses/yolanda.jpg')
seam4.photo.attach(io: seam4_file, filename: 'yolanda.jpg', content_type: 'image/jpg')
puts seam4.first_name

# Services
puts "Creating Services..."

clothings = ['wedding dress', 'suit', 'dress', 'skirt']
repairs = ['fitting', 'button', 'zipper']
materials = ['lace', 'suede', 'leather', 'satin']

service1 = Service.new(
  name: "#{materials[0]} #{clothings[0]} - #{repairs[0]}",
  clothing: clothings[0],
  repair: repairs[0],
  material: materials[0],
  description: "Doing drop off need to take about 30mins",
  price: 200,
  estimated_time: 3
)
service1.seamstress = seam1
service1.save
puts service1.name

service2 = Service.new(
  name: "#{materials[0]} #{clothings[0]} - #{repairs[1]}",
  clothing: clothings[0],
  repair: repairs[1],
  material: materials[0],
  description: "5 buttons maximum",
  price: 20,
  estimated_time: 1
)
service2.seamstress = seam1
service2.save
puts service2.name

# Orders
puts "Creating Orders..."

order1 = Order.new
order1.client = client
order1.seamstress = seam1
order1.save

# Order Item
order_item1 = OrderItem.new
order_item1.service = service1
order_item1.order = order1
