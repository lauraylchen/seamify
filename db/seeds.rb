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
puts client.first_name

seam1 = User.create(
  first_name: 'Rey',
  last_name: 'Kawakubo',
  bio: "I studied fashion design in Tokyo then I move to Montreal.
        Then I started to make wedding dresses and specialized in it.
        I put all of my efforts in the details and hopefully I can make YOUR wedding dress.",
  address: "2900 Edouard Montpetit Blvd, Montreal",
  email: 'seam1@gmail.com',
  password: '123456',
  seamstress: true
)
seam1_file = URI.open('https://res.cloudinary.com/dq1xs22hk/image/upload/v1645853245/animals/seamstresses/rey.jpg')
seam1.photo.attach(io: seam1_file, filename: 'rey.jpg', content_type: 'image/jpg')
puts seam1.first_name

seam2 = User.create(
  first_name: 'Giuseppe',
  last_name: 'Paccini',
  bio: "I started working with my fatther in Little Italy and
        we had a lot of customers, I decided to keep the business in the family and
        to this day at 82 years old, I still fix and make suits and wedding dresses for the elite.",
  address: "5505 Boul. Saint-Laurent #2000, Montréal, QC H2T 1S6",
  email: 'seam2@gmail.com',
  password: '123456',
  seamstress: true
)
seam2_file = URI.open('https://res.cloudinary.com/dq1xs22hk/image/upload/v1645846668/animals/seamstresses/giuseppe.jpg')
seam2.photo.attach(io: seam2_file, filename: 'giuseppe.jpg', content_type: 'image/jpg')
puts seam2.first_name

seam3 = User.create(
  first_name: 'Andrea',
  last_name: 'Smith',
  bio: "I've studied Fashion Design in my early twenties
        and noticed right away how learning to sew has became helpful to me and others.
        I've worked for Gucci then decided to retire early and help my community instead.
        I offer high quality repairs at a reasonable price.",
  address: "4237 Henri Julien Ave, Montreal, Quebec H2W 1E5",
  email: 'seam3@gmail.com',
  password: '123456',
  seamstress: true
)
seam3_file = URI.open('https://res.cloudinary.com/dq1xs22hk/image/upload/v1645852094/animals/seamstresses/andrea.jpg')
seam3.photo.attach(io: seam3_file, filename: 'andrea.jpg', content_type: 'image/jpg')
puts seam3.first_name

seam4 = User.create(
  first_name: 'Yolanda',
  last_name: 'Fado',
  bio: "I am from Portugal and came here to work in the fashion industry, I specialize in leather and
        suede alterations as my mother was a shoe maker back in Portugal.
        For me, fixing leather and suede is a second nature.",
  address: "750 Av. Outremont, Outremont, QC H2V 3N3",
  email: 'seam4@gmail.com',
  password: '123456',
  seamstress: true
)
seam4_file = URI.open('https://res.cloudinary.com/dq1xs22hk/image/upload/v1645846471/animals/seamstresses/yolanda.jpg')
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
  price: 0.00,
  estimated_time: 0
)
service1.seamstress = seam1
service1.save

# Orders
puts "Creating Orders..."

order1 = Order.new
order1.client = client
order1.seamstress = seam1
order1.save

order2 = Order.new
order2.client = client
order2.seamstress = seam1
order2.save
