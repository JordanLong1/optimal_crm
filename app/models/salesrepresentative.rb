class Salesrepresentative < ApplicationRecord
    has_many :tasks 
    has_many :organizations 
    has_many :leads, through: :organizations 
end
