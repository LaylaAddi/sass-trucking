module Dropdown
  extend ActiveSupport::Concern   
  
PercentageSelect =
    ["Select %"], 
    ['5%', ".05"],
    ['8%', ".08"],
    ['10%', ".10"],
    ['12%', ".12"],
    ['13%', ".13"],
    ['15%', ".15"],
    ['18%', ".18"],
    ['20%', ".20"],
    ['22%', ".22"],
    ['24%', ".24"],
    ['25%', ".25"],
    ['28%', ".28"],
    ['30%', ".30"],
    ['35%', ".35"],
    ['40%', ".40"],
    ['45%', ".45"],
    ['50%', ".50"],
    ['55%', ".55"],
    ['60%', ".60"],
    ['65%', ".65"],
    ['70%', ".70"],
    ['100%', "100"]


CompanyProfileMembershipStatus =
[ 
  
  "Member",
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
  [
    "FTL",
    "LTL"
   ]
   
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
    ["submitted", "submitted"],
    ["pending", "pending"],
    ["approved", "approved"],
    ["declined", "declined"],
    ["active", "active"],
    ["sick_leave", "sick_leave"],
    ["suspended", "suspended"], 
    ["vacation", "vacation"],
    ["fired", "fired"]
  ]  
  
    DeliveryStatus =
  [
    ["Waiting For Load"],    
    ["Driving to Pick Up"],
    ["At Pick Up - Waiting"],
    ["At Pick Up - Loading"],
    ["Driving to Deliver"],
    ["At Delivery - Waiting"],
    ["At Delivery - Unloading"],
    ["Off Duty"]
  ]    
  
  OfficeLocation =  
  [
    ["Buffalo"],
    ["Dallas"]
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
    ['Insurance', 'Insurance'],
    ['Trailer Rent', 'Trailer Rent'],
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
    ["Active", "Active" ],
    ["Pending", "Pending" ],
    ["Complete", "Complete" ],
    ["Paid", "Paid" ],
    ["Cancelled", "Cancelled" ]
  ]
  
  LoadDocumentType =
  [
    ["Load Confirmation", "Load Confirmation"],
    ["BOL", "BOL"],
    ["Other", "Other"]
  ]
      
 
end

