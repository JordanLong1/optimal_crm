class Salesrepresentative < ApplicationRecord
    has_secure_password
    
    has_many :tasks 
    has_many :leads
    has_many :organizations, through: :leads

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true 

end
