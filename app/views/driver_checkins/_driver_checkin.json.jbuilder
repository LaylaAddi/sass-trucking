json.extract! driver_checkin, :id, :street, :city, :state, :zip, :latitude, :longitude, :status, :notes, :driver_user_id, :created_at, :updated_at
json.url driver_checkin_url(driver_checkin, format: :json)