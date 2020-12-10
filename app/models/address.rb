class Address < ApplicationRecord

   belongs_to :customer
   
   validates :name, presence: true
   validates :postal_code, presence: true, length: { is: 7 }
   validates :address, presence: true
 
#  order/newで使う値を定義
   def post_address_name
    '〒' + self.postal_code.tr('０-９', '0-9') + ' ' + self.address + ' '+ self.name
   end
end
