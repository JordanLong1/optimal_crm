class Lead < ApplicationRecord
    
     belongs_to :organization, optional: true 
    belongs_to :salesrepresentative, optional: true

    validates :name, presence: true 
    validates :name, uniqueness: true 
end
