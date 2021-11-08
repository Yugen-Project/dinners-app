class Restaurant < ApplicationRecord
    has_many :meals
    has_many :orders
    validates :name, presence: true
    validates :description, presence: true
    # validates :capacity, presence: true , length: { minimum: 0 }
    # validates :date, presence: true
    validates :contact, presence: true
end
