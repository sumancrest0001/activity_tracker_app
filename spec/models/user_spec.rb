# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = create(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  context 'Username validation' do
    it 'Valid username check' do
      expect(@user).to be_valid
    end

    it 'should check minimum length of username ' do
      @user.name = 'ab'
      expect(@user).to_not be_valid
    end
  end

  context 'Email validation' do
    it 'Valid email check' do
      expect(@user).to be_valid
    end

    it 'should match the regex defined' do
      @user.email = 'suman'
      expect(@user).to_not be_valid
    end
  end
end
