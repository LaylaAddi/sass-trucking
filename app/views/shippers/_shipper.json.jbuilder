json.extract! shipper, :id, :name, :handle, :contact_person, :telephone, :fax, :location, :broker_mc, :carrier_mc, :dot_number, :website, :street, :city, :state, :zip, :notes, :created_at, :updated_at
json.url shipper_url(shipper, format: :json)