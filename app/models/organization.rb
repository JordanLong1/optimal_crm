class Organization < ApplicationRecord

    has_many :leads
    has_many :salesrepresentative, through: :leads
end
