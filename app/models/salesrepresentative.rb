class Salesrepresentative < ApplicationRecord
    has_many :tasks 
    has_many :leads
    has_many :organizations, through: :leads
end
