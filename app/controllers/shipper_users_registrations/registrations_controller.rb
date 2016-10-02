class ShipperUsersRegistrations::RegistrationsController < Devise::RegistrationsController 
  
  
  private

  def sign_up_params
    params.require(:shipper_users).permit(:password, 
                                          :password_confirmation,
                                          :email,
                                          :first_name,
                                          :last_name,
                                          :telephone,
                                          :extention,
                                          :cellphone,
                                          :street, 
                                          :city, 
                                          :state, 
                                          :zip,  
                                          :type,
                                          :emergency_contact,
                                          :emergency_contact_number
                                          )
  end

  def account_update_params
    params.require(:company_users).permit(:password, 
                                          :password_confirmation,
                                          :current_password,
                                          :email,
                                          :first_name,
                                          :last_name,
                                          :telephone,
                                          :extention,
                                          :cellphone,
                                          :street, 
                                          :city, 
                                          :state, 
                                          :zip,  
                                          :type,
                                          :image, 
                                          :profile_image,
                                          :emergency_contact,
                                          :emergency_contact_number,
                                          :company_profile_admin,
                                          :dispatcher,
                                          :office,
                                          :office,
                                          :maintenance
                                          )
                              
                              
  end
end      

