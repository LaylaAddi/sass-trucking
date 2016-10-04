module Dropdown
  extend ActiveSupport::Concern
  
  AddressType =
  [ "Origin",
    "Destination"
    ]
  
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
  
    DeliveryStatus =
  [
    "Waiting For Load",    
    "Driving to Pick Up",
    "At Pick Up - Waiting",
    "At Pick Up - Loading",
    "Driving to Deliver",
    "At Delivery - Waiting",
    "At Delivery - Unloading",
    "Off Duty"
  ]    
  
  OfficeLocation =  
  [
    "Chicago",
    "Dallas",
    "Sofiia"
  ]     
    
    UserType =
  [ "registered",
    "office",
    "dispatch",
    "admin"
  ]   
  
    Yard = 
  [
    ['Buffalo', 'Buffalo'],
    ['Miami', 'Miami'],
    ['Dallas', 'Dallas'],
    ['Los Angeles', 'Los Angeles']
  ] 
  
  TruckStatus =   
  [
    ['Parked', 'Parked'],
    ['In Shop', 'In Shop'],
    ['Active', 'Active'],
    ['Not Known', 'Not Known'] 
  ]
  

  ExpenseType =   
  [
    ['Fuel', 'Fuel'],
    ['Food', 'Food'],
    ['Maintenance', 'Maintenance'],
    ['Repairs', 'Repairs'],
    ['Other', 'Other']    
  ]     
  
  LoadStatusStatus =
  [
  "Pending",
   "Active",
 "Complete",
  "Cancelled"
  ]
      
    
    
end