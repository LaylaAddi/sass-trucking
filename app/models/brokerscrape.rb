# @company_manager = CompanyManager.all
@company = Company.last
@oa = OperatingAuthority.last
 @name = @oa.number

    
require 'capybara/poltergeist'
session = Capybara::Session.new(:poltergeist)
session.visit('https://safer.fmcsa.dot.gov/CompanySnapshot.aspx')
session.choose('2')
session.fill_in('4', with: @name)
session.find('input[type="SUBMIT"]').click


name = session.current_url
address = session.all('.queryfield')[0].text.strip  
telephone = session.all('.queryfield')[1].text.strip  
 

OperatingAuthority.create!(name: name,
                address: address,
                telephone: telephone 
                )
