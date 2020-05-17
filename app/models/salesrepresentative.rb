class Salesrepresentative < ApplicationRecord
    has_secure_password
    
    has_many :tasks 
    has_many :leads
    has_many :organizations, through: :leads

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true 

    # scoping the lead with the current user 
    # scope :salesrep_leads, -> {leads.where("salesrepresentative_id == ?", self.id )}
    #scope :with_long_title, ->(length) { where("LENGTH(title) > ?", length) }



end
