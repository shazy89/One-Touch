class Table < ApplicationRecord
    has_many :select_items
    belongs_to :user
    has_many :products, through: :select_items

end
