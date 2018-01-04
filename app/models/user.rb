class User < ApplicationRecord
  include Clearance::User

  enum role: { user: 0, superadmin: 1 }


# In app/models/user.rb    
 
    has_many :authentications, dependent: :destroy
    has_many :listings

    def self.create_with_auth_and_hash(authentication, auth_hash)
      
      user = self.create!(
        name: auth_hash["extra"]["raw_info"]["name"],
        gender: auth_hash["extra"]["raw_info"]["gender"],
        email: auth_hash["extra"]["raw_info"]["email"],
        password: SecureRandom.hex(16)
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end
 end