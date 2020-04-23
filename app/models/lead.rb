class Lead < ApplicationRecord
    
     belongs_to :organization
    belongs_to :salesrepresentative
end
