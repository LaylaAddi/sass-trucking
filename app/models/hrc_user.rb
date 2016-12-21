class HrcUser < User
  has_many :loads
  has_many :driver_users, through: :loads
  has_many :conversations
  ransack_alias :hrc_search_params, 
  :first_name_or_last_name_or_email 
  mount_uploader :profile_image, UserProfileImageUploader  
  mount_uploader :profile_bg, UserBackgroundImageUploader  
  
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
    	DHrcUser.create! row.to_hash
  	end
  end  
end