# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'all credentials are provided' do
    it ' is valid ' do
      user = User.new(name: 'example', email: 'example@exs.com')
      user.save
      event = user.created_events.build(date: Date.tomorrow, description: 'asd qwerac wecfwec')
      expect(event).to be_valid
    end
  end

  context 'no date provided' do
    it ' is not valid ' do
      event = Event.new(date: nil, creator_id: 1, description: 'dsadas freac sad')
      expect(event.valid?).to be false
    end
  end

  context 'no crator id provided' do
    it ' is not valid ' do
      event = Event.new(date: Date.tomorrow, creator_id: nil, description: 'dsadas freac sad')
      expect(event.valid?).to be false
    end
  end

  context 'no description provided' do
    it ' is not valid ' do
      event = Event.new(date: Date.tomorrow, creator_id: 1, description: '')
      expect(event.valid?).to be false
    end
  end
end
