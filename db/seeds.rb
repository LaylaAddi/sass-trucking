
   States =  
  [
  'Alabama', 
  'Alaska', 
  'Arizona',
  'Arkansas', 
  'California', 
  'Colorado',
  'Connecticut',
  'Delaware', 
  'District of Columbia', 
  'Florida',
  'Georgia',
  'Hawaii', 
  'Idaho', 
  'Illinois', 
  'Indiana', 
  'Iowa', 
  'Kansas', 
  'Kentucky',
  'Louisiana',
  'Maine', 
  'Maryland', 
  'Massachusetts', 
  'Michigan',
  'Minnesota',
  'Mississippi',
  'Missouri', 
  'Montana', 
  'Nebraska', 
  'Nevada',
  'New Hampshire', 
  'New Jersey', 
  'New Mexico', 
  'New York', 
  'North Carolina',
  'North Dakota', 
  'Ohio', 
  'Oklahoma', 
  'Oregon', 
  'Pennsylvania',
  'Puerto Rico', 
  'Rhode Island', 
  'South Carolina', 
  'South Dakota', 
  'Tennessee', 
  'Texas', 
  'Utah', 
  'Vermont',
  'Virginia', 
  'Washington', 
  'West Virginia',
  'Wisconsin', 
  'Wyoming'
  ]
 
    EmploymentStatus =
  [
    "submitted", 
    "pending",
    "approved",
    "declined",
    "active",
    "sick_leave",
    "suspended",
    "vacation",
    "fired"
  ]  

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
  cellphone: "716.986.4010",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  dispatcher: "true",
  admin: "true",
  employment_status: "active"
  )
  puts steve.inspect
kathy = HrcUser.create(
  password: "password",
  password_confirmation: "password", 
  first_name: "Kathy",
  last_name: "Rodriguez",
  email: "kathy@hrclogistics.com",
  cellphone: "716.986.4324",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  dispatcher: "true",
  admin: "true",
  employment_status: "active"
  )
  puts kathy.inspect
  
  
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
# 50.times do
# driver = DriverUser.create(
# password: "password",
#   password_confirmation: "password", 
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   email: Faker::Internet.email,
#   cellphone: Faker::PhoneNumber.phone_number,  
#   street: Faker::Address.street_name,
#   telephone: Faker::PhoneNumber.phone_number,
#   city: city_data.sample,
#   zip: "123456",
#   emergency_contact: Faker::Name.first_name,
#   emergency_contact_number: Faker::PhoneNumber.phone_number,
#   employment_status: EmploymentStatus.sample
#   )
#   puts driver.inspect
# end

10.times do
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
  shipping_receiving: boolean.sample
  )
  puts shipperuser.inspect
end


10.times do     
companyprofile = CompanyProfile.create!(
company_name: Faker::Company.name, 
telephone: Faker::PhoneNumber.phone_number,
street: Faker::Address.street_address,
city: "CityVille",
state: States.sample,
zip: Faker::Address.zip,
fax: Faker::PhoneNumber.phone_number,
contact: Faker::Name.first_name, 
website: Faker::Internet.url,
broker_mc_number: "985484",
carrier_mc_number: "985484",
us_dot_number: "2921696",
email: Faker::Internet.email
  )
 puts companyprofile.inspect
end

hrcprofile = CompanyProfile.create!(
company_name: "HRC Logistics LLC", 
telephone: "469.301.2226",
street: "14241 Dallas Parkway Suite 650",
city: "Dallas",
state: "Texas",
zip: "75254",
fax: "469.301.2226",
contact: "Kathy", 
website: "hrclogistics.com",
broker_mc_number: "985484",
carrier_mc_number: "985484",
us_dot_number: "2921696",
email: "support@hrclogistics.com"
)


