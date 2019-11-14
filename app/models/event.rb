# frozen_string_literal: true

class Event < ApplicationRecord
  scope :past, -> { where('date <= ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }

  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :event_authoring, foreign_key: :attended_event_id
  has_many :attendees, through: :event_authoring, source: :event_attendee

  validates :date , presence: true
  validates :creator_id, presence: true
  validates :description , presence: true
end
