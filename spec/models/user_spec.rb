# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates login' do
    should validate_presence_of :login
  end

  it 'user is active  by default' do
    user = User.new(login: 'Test')
    expect(user.save).to eq(true)
  end
end
