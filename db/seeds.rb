broker_mc = [
  "131029",
  "252947",
  "211123",
  "044128",
  "322572",
  "175953",
  "985484"
  ]
  
dot = [
  "425389",
 "2223295",
  "221569",
 "2211804",
 "2921696"
  ]  

boolean = [
  "true",
  "false"
  ]



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
  

steve = HrcUser.create(
  password: "password",
  password_confirmation: "password", 
  first_name: "Steve",
  last_name: "Chesnowtiz",
  email: "steve@hrclogistics.com",
  cellphone: "716.986.4324",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  dispatcher: "true"
  )
  puts steve.inspect

  
  
10.times do
hrcuser = HrcUser.create(
  password: "password",
  password_confirmation: "password", 
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  cellphone: Faker::PhoneNumber.phone_number,  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  office: "false",
  maintenance: "false",
  shipping_receiving: "false",
  dispatcher: "true",
  admin: "false"
  )
  puts hrcuser.inspect
end
100.times do
driver = DriverUser.create(
 password: "password",
  password_confirmation: "password", 
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  cellphone: Faker::PhoneNumber.phone_number,  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  )
  puts driver.inspect
end

100.times do
shipperuser = ShipperUser.create(
  password: "password",
  password_confirmation: "password", 
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  cellphone: Faker::PhoneNumber.phone_number,  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  dispatcher: boolean.sample,
  office: boolean.sample,
  maintenance: boolean.sample,
  shipping_receiving: boolean.sample,
  driver: boolean.sample
  )
  puts shipperuser.inspect
end


100.times do     
companyprofile = CompanyProfile.create!(
name: Faker::Company.name, 
location: "Anywhere Ville",
telephone: "555.555.5555",
website: Faker::Internet.url,
logo:"",
broker_mc_number: "985484",
carrier_mc_number: "985484",
us_dot_number: "2921696",
updated_by:"",
contact: Faker::Name.first_name,
profile_image:"" 
  )
 puts companyprofile.inspect
end