json.extract! company, :id, :name, :street, :city, :state, :zip, :telephone, :website, :logo, :broker_mc, :carrier_mc, :us_dot, :company_manager_id, :created_at, :updated_at
json.url company_url(company, format: :json)