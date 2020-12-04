class User < ApplicationRecord
    
   
    has_many :ideas, dependent: :nullify
    has_many :reviews, dependent: :nullify

    has_secure_password
    
    def full_name
        "#{first_name} #{last_name}".strip.capitalize!
    end
end
