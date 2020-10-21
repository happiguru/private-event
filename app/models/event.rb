class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :invitations, foreign_key: 'attended_event_id'
    has_many :attendees, through: :invitations

    scope :past_events, -> {where('date < ?', DateTime.now) }
    scope :upcoming_events, -> {where('date > ?', DateTime.now) }
end
