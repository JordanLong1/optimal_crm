class Task < ApplicationRecord
    belongs_to :salesrepresentative, optional: true


    validates :title, presence: true 
    validates :title, uniqueness: true 

    # scope :with_short_title, -> { where("LENGTH(title) < 10") }
    
end
