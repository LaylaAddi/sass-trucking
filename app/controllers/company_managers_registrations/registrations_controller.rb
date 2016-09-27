class CompanyManagersRegistrations::RegistrationsController < Devise::RegistrationsController 
  
  
  private

  def sign_up_params
    params.require(:company_manager).permit(:password, 
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
                                            :emergency_contact_number,
                                            )
  end

  def account_update_params
    params.require(:company_manager).permit(:password, 
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
                                            :emergency_contact,
                                            :emergency_contact_number,
                                            :company_admin,
                                            :cdispatcher,
                                            :coffice,
                                            :cmaintenance,
                                            :cshipping_receiving,                                            
                                            )
                              
  end
end      

