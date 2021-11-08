class Meal < ApplicationRecord
    belongs_to :Restaurant
    has_many :orders, through: :Restaurant
    validates :name, presence: true
    validates :description, presence: true
end
