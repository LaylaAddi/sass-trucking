class DriverUsers::RegistrationsController < Devise::RegistrationsController
  
  
  private

def sign_up_params
  params.require(:driver_user).permit(:password, 
                                      :password_confirmation,
                                      :email,
                                      :first_name,
                                      :last_name,
                                      :telephone,
                                      :mobile_email,
                                      :street, 
                                      :city, 
                                      :state, 
                                      :zip,  
                                      :type,
                                      :emergency_contact,
                                      :emergency_contact_number,
                                      :company_admin                                
                                      )
end

def account_update_params
  params.require(:driver_user).permit(:password, 
                                      :password_confirmation,
                                      :current_password,
                                      :email,
                                      :first_name,
                                      :last_name,
                                      :telephone,
                                      :mobile_email,
                                      :street, 
                                      :city, 
                                      :state, 
                                      :zip,  
                                      :type,
                                      :emergency_contact,
                                      :emergency_contact_number,
                                      :company_admin                                   
                                      )
                            
end
end      