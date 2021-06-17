class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :location
  has_many :car_parts
end
