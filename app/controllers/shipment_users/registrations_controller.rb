class ShipmentUsers::RegistrationsController < Devise::RegistrationsController
  
  
  private

def sign_up_params
  params.require(:shipment_user).permit(:password, 
                                     :password_confirmation,
                                     :email,
                                     :first_name,
                                     :last_name,
                                     :telephone,
                                     :street, 
                                     :city, 
                                     :state, 
                                     :zip,  
                                     :type                                  
                                     )
end

def account_update_params
  params.require(:shipment_user).permit(:password, 
                                       :password_confirmation,
                                       :current_password,
                                       :email,
                                       :first_name,
                                       :last_name,
                                       :telephone,
                                       :street, 
                                       :city, 
                                       :state, 
                                       :zip,  
                                       :type                                  
                                       )
                            
end
end      