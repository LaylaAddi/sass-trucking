class DriverUser < User
  has_many :loads
  has_many :trucks  
  has_many :trailers 
  has_many :driver_statements, through: :loads
  has_many :driver_statements
 ransack_alias :driver_search_params,
  :first_name_or_last_name_or_email 

 

  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end 
  
	def self.import(file)	
  	CSV.foreach(file.path, headers: true) do |row|
    	DriverUser.create! row.to_hash
  	end
  end  
  
end