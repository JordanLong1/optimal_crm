class Task < ApplicationRecord
    belongs_to :sales_representative 


    validates :name, presence: true 
    validates :name, uniqueness: true 
    
end
