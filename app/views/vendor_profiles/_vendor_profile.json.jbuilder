json.extract! vendor_profile, :id, :company_name, :street, :city, :state, :zip, :telephone, :fax, :website, :logo, :contact_name, :email, :company_profile_id, :created_at, :updated_at
json.url vendor_profile_url(vendor_profile, format: :json)