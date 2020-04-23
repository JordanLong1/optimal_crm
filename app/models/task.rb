class Task < ApplicationRecord
    has_many :leads
    has_many :salesrepresentatives, through: :leads 
end
