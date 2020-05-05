class Task < ApplicationRecord
    belongs_to :sales_representative 


    validates :title, presence: true 
    validates :title, uniqueness: true 
    
end
