city_data = [
  "Chicago. Illinois",
  "Miami, Florida",
  "Toronto, Ontario",
  "Detroit, Michigan",
  "Atlanta, Georgia",
  "New York, New York",
  "Buffalo, New York",
  "Dallas, Texas",
  "Vancouver, British Columbia",
  "Los Angeles, California",
  "San Fransisco, California",
  "Portland, Maine",
  "Nashville, Tennessee",
  "Tampa, Florida",
  "Clevland, Ohio",
  "Niagara Falls, New York",
  "Las Vegas, Nevada",
  "Rapid City, South Dakoda",
  "Casper, Wyoming",
  "Spokane, Washington",
  "Billings, Montana",
  "Green Bay, Wisconsin",
  "Phoenix, Arizona"
  ]


# 150.times do
# driver = User.create(
#   password: "password",
#   password_confirmation: "password", 
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   email: Faker::Internet.email,  
#   street: Faker::Address.street_name,
#   telephone:Faker::PhoneNumber.phone_number,
#   city: city_data.sample,
#   zip: "123456",
#   type: "DriverUser" 
#   )
#   puts driver.inspect
# end

150.times do
dispatcher = User.create(
  password: "password",
  password_confirmation: "password", 
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,  
  street: Faker::Address.street_name,
  telephone:Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  type: "DispatchUser" 
  )
  puts dispatcher.inspect
end

150.times do
shipper = User.create(
  password: "password",
  password_confirmation: "password", 
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,  
  street: Faker::Address.street_name,
  telephone:Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  type: "ShipperUser" 
  )
  puts shipper.inspect
end