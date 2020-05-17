require 'rails_helper'

RSpec.describe Task, type: :model do
  before :each do
    @user = User.create!(name: 'suman12345',
                         email: 'suman1234@gmail.com',
                         password: 'suman123',
                         password_confirmation: 'suman123')
    @main_activity = @user.main_activities.create(title: 'This is my first record', recorded: '2020-05-07')
    @task = @main_activity.create_task(sleep: 9, cook: 2, work: 9, exercise: 1.5, read: 1, watch: 1.5)
    @task2 = Task.create(sleep: 8, cook: 3, work: 7, exercise: 1.5, read: 2, watch: 2)
  end

  context 'task validation' do
    it 'should return true' do
      expect(@task).to be_valid
    end
  end

  context 'should check association between mainactivity and task' do
    it 'should check parent mainactivity' do
      expect(@task2).to_not be_valid
    end
  end
end
