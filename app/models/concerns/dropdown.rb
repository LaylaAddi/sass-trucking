module Dropdown
  extend ActiveSupport::Concern   
  
PercentageSelect =
  [
    ['20%', ".20"],
    ['5%', ".05"],
    ['8%', ".08"],
    ['10%', ".10"],
    ['12%', ".12"],
    ['15%', ".15"],
    ['18%', ".18"],
    ['22%', ".22"],
    ['24%', ".24"],
    ['25%', ".25"],
    ['28%', ".28"],
    ['30%', ".30"],
    ['35%', ".35"]
  ] 
  
  
CompanyProfileMembershipStatus =
[ "Member",
  "Non Member"
]
  
  PickupTimeNotes =
  [
    "Appointment Booked At"
  ]
  
  DeliveryTimeNotes =
  [
    "Appointment Booked At",
    "Multiple Deliveries",
    "Appointments with Multiple Deliveries"
  ]
     
  

  LoadSize =
  ["FTL",
   "LTL"]
   
  AddressType =
  
  [ 
    "Destination",
    "Origin"
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
  
    EquipmentType =   
  [
    ['Van', 'Van'],
    ['Flatbed', 'Flatbed'],
    ['Reefer', 'Reefer'],
    ['RGN', 'RGN'],
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