class Lead < ApplicationRecord
    
     belongs_to :organization, optional: true 
    belongs_to :salesrepresentative, optional: true

    validates :name, :email, :phone_number, presence: true 
    validates :name, :email, :phone_number, uniqueness: true 
end
