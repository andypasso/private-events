# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'if all credential are provided ' do
    it 'is valid ' do
      user = User.new(name: 'example', email: 'example@exs.com')
      expect(user.valid?).to be true
    end
  end
  context 'if email is not provided' do
    it 'is not valid' do
      user = User.new(name: 'example', email: '')
      expect(user.valid?).to be false
    end
  end
  context 'if name is not provided' do
    user = User.new(name: '', email: 'exampl@exs.com')
    it 'is not valid' do
      expect(user.valid?).to be false
    end
  end
end
