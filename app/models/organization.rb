class Organization < ApplicationRecord

    belongs_ to :salesrepresentative 
    has_many :leads 
end
