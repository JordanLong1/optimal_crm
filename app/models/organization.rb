class Organization < ApplicationRecord

    has_many :leads
    has_many :salesrepresentatives, through: :leads


    validates :name, presence: true 
    validates :name, :address, uniqueness: true 

    scope :highest, -> {Organization.order("revenue DESC").limit(3)} 



end
