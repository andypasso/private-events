# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :event_authoring, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_authoring

  validates :name, presence: true
  validates :email, presence: true, length: { minimum: 5, maximum: 20 }
end
