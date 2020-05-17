require 'rails_helper'

RSpec.describe MainActivity, type: :model do
  before :each do
    @user = create(:user)
    @main_activity = @user.main_activities.create(title: 'This is my first record', recorded: '2020-05-07')
    @main_activity2 = MainActivity.create(title: 'This is an activity without a user', recorded: '2020-05-06')
  end

  context 'mainActivity validation' do
    it 'should return true' do
      expect(@main_activity).to be_valid
    end
  end
  it 'should check parent user' do
    expect(@main_activity2).to_not be_valid
  end

  it 'should check presence of all the fields' do
    @main_activity.title = nil
    expect(@main_activity).to_not be_valid
  end
end
