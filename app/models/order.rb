class Order < ApplicationRecord
    belongs_to :restaurant
    belongs_to :user
    # validates :name, presence: true
    # validates :description, presence: true
    # validates :capacity, presence: true , length: { minimum: 0 }
    validates :date, presence: true
    # validates :phone_number, presence: true
end
