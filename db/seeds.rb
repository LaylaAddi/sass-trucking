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
  
  
# 5.times do
# manager = User.create(
#   password: "password",
#   password_confirmation: "password", 
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   email: Faker::Internet.email,  
#   street: Faker::Address.street_name,
#   telephone:Faker::PhoneNumber.phone_number,
#   city: city_data.sample,
#   zip: "123456",
#   type: "ManagementUser" 
#   )
#   puts manager.inspect
# end 


100.times do
driver = User.create(
  password: "password",
  password_confirmation: "password", 
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  mobile_email: 'steve@hrclogistics.com',  
  street: Faker::Address.street_name,
  telephone:Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  type: "DriverUser",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number 
  )
  puts driver.inspect
end

5.times do
office = User.create(
  password: "password",
  password_confirmation: "password", 
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email, 
  mobile_email: 's.chesnowitz@gmail.com',  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  extention: Faker::PhoneNumber.extension,  
  city: city_data.sample,
  zip: "123456",
  type: "OfficeUser",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number 
  )
  puts office.inspect
end

100.times do
shipper = User.create(
  password: "password",
  password_confirmation: "password", 
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  mobile_email: 'steve@hrclogistics.com',
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  extention: Faker::PhoneNumber.extension,    
  city: city_data.sample,
  zip: "123456",
  type: "ShipmentUser",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number
  )
  puts shipper.inspect
end