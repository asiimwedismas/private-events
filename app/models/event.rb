class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :attendences
  has_many :attendees, through: :attendences, source: :user

  scope :past, -> { where('event_date < ?', Time.now).to_a }
  scope :upcoming, -> { where('event_date > ?', Time.now).to_a }
end
