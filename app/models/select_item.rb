class SelectItem < ApplicationRecord
  belongs_to :product
  belongs_to :table_id
end