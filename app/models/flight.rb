class Flight < ApplicationRecord
  validates :scheduled_on, :duration, presence: true

  belongs_to :from_airport, class_name: "Airport", foreign_key: "from_airport_id"
  belongs_to :to_airport, class_name: "Airport", foreign_key: "to_airport_id"
  has_many :bookings
  has_many :passengers, through: :bookings
end
