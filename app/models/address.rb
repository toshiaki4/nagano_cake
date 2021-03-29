class Address < ApplicationRecord
    belongs_to :customer
    def name_address_postal_code
      '〒' + self.postal_code + self.address + self.name
    end
end
