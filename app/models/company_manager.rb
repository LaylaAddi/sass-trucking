class CompanyManager < User
  has_one :company
  
  before_create :build_company
end