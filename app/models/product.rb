class Product < ApplicationRecord
    has_many :select_items
    belongs_to :user
    has_many :tables, through: :select_items

    validates :title, presence: true
    validates :price, presence: true

    scope :sorted_title, -> { self.order(title: :desc)}
    scope :search, -> (term) { self.sorted_title.where("title LIKE ?", "%#{term}%") }
    

end
        
    

