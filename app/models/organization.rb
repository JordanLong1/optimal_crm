class Organization < ApplicationRecord

    has_many :leads
    has_many :salesrepresentatives, through: :leads


    validates :name, presence: true 
    validates :name, :address, uniqueness: true 
end
