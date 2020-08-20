class Table < ApplicationRecord
    has_many :select_items
    belongs_to :user
    has_many :products, through: :select_items

    validates :tabel_num, presence: true, uniqueness: true

    scope :sorted_numbers, -> { self.order(tabel_num: :asc)}

    
    def name_lastname
        "#{self.user.first_name} #{self.user.last_name}"
    end
end
     

   

