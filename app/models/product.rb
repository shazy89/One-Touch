class Product < ApplicationRecord
    has_many :select_items
    belongs_to :user
end
