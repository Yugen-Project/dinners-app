class Meal < ApplicationRecord
    belongs_to :Restaurant
    has_many :orders, through: :Restaurant
end
