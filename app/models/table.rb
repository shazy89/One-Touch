class Table < ApplicationRecord
    has_many :select_items
    has_many :products, through: :select_items
    
end
