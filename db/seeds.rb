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
  
  


100.times do
driver = User.create(
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
  type: "CompanyUser",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  company_admin: Faker::Boolean.boolean,
  dispatcher: Faker::Boolean.boolean,
  office: Faker::Boolean.boolean,
  maintenance: Faker::Boolean.boolean,
  shipping_receiving: Faker::Boolean.boolean,
  driver: "true"
  )
  puts driver.inspect
end

      t.boolean :company_admin, default: false
      t.boolean :admin, default: false
      t.boolean :dispatcher, default: false
      t.boolean :office, default: false
      t.boolean :maintenance, default: false  
      t.boolean :shipping_receiving, default: false 