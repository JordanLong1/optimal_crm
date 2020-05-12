class Task < ApplicationRecord
    belongs_to :sales_representative, optional: true


    validates :title, presence: true 
    validates :title, uniqueness: true 
    
end
