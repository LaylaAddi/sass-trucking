json.extract! company_profile_membership, :id, :company_profile_id, :user_id, :membership_type, :created_at, :updated_at
json.url company_profile_membership_url(company_profile_membership, format: :json)