# Assuming 'is_vendor' is the correct field name based on your application schema

user1 = User.create!(
  email: 'alice@email.com',
  password: 'password',
  isvendors: 'n'
)

user2 = User.create!(
  email: 'bob@email.com',
  password: 'password',
  isvendors: 'n'
)

user3 = User.create!(
  email: 'sasi@email.com',
  password: 'password',
  isvendors: 'y'
)

# Cushions
cushion_1 = Cushion.create!(
  name: 'Happy Cushion',
  price: 19.99,
  shape: 'Round',
  emoji_type: 'happy'
)
cushion_2 = Cushion.create!(
  name: 'Sad Cushion',
  price: 15.99,
  shape: 'Square',
  emoji_type: 'sad'
)
cushion_3 = Cushion.create!(
  name: 'Love Cushion',
  price: 18.99,
  shape: 'Round',
  emoji_type: 'love'
)
cushion_4 = Cushion.create!(
  name: 'Angry Cushion',
  price: 16.99,
  shape: 'Square',
  emoji_type: 'angry'
)
cushion_5 = Cushion.create!(
  name: 'Surprised Cushion',
  price: 17.99,
  shape: 'Square',
  emoji_type: 'suprised'
)
cushion_6 = Cushion.create!(
  name: 'Cool Cushion',
  price: 20.99,
  shape: 'Square',
  emoji_type: 'cool'
)
cushion_7 = Cushion.create!(
  name: 'Silly Cushion',
  price: 14.99,
  shape: 'Square',
  emoji_type: 'silly'
)
cushion_8 = Cushion.create!(
  name: 'Wink Cushion',
  price: 21.99,
  shape: 'Round',
  emoji_type: 'wink'
)

# Attaching images assuming Active Storage is set up
cushion_1.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'happy-round.jpg')), filename: 'happy-round.jpg')
cushion_2.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'sad-square.jpg')), filename: 'sad-square.jpg')
cushion_3.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'love-round.jpg')), filename: 'love-round.jpg')
cushion_4.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'angry-square.jpg')), filename: 'angry-square.jpg')
cushion_5.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'suprised-square.jpg')), filename: 'suprised-round.jpg')
cushion_6.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'cool-square.jpg')), filename: 'cool-round.jpg')
cushion_7.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'silly-square.jpg')), filename: 'silly-square.jpg')
cushion_8.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'wink-square.jpg')), filename: 'wink-round.jpg')

# Make sure to handle exceptions for file not found and ensure the file paths are correct.
