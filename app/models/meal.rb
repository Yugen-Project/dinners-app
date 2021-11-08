class Meal < ApplicationRecord
    belongs_to :restaurant
    has_many :orders, through: :restaurant
    validates :name, presence: true
    validates :description, presence: true
end
