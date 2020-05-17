require 'rails_helper'

RSpec.describe MainActivitiesController, type: :controller do
  before(:each) do
    user = User.create!(name: 'example123',
                        email: 'example123@gmail.com',
                        password: 'example123',
                        password_confirmation: 'example123')
    session[:user_id] = user.id
  end
  describe 'index action' do
    context 'when current user is present' do
      it 'should return success status' do
        get :index
        json = JSON.parse(response.body)
        expect(json['status']).to eql('SUCCESS')
        expect(json['data']['mainactivities']). to eql([])
      end
    end
  end

  describe 'create method' do
    context 'when passed attributes are valid' do
      let(:valid_params) do
        {
          data: {
            title: 'first test',
            recorded: '2020-05-17',
            sleep: 9,
            cook: 2,
            work: 9,
            exercise: 1.5,
            read: 1.5,
            watch: 2
          }
        }
      end
      it 'should create the mainactivity as well as task' do
        post :create, { params: valid_params }
        json = JSON.parse(response.body)
        expect(json['mainactivity']['title']).to eql('first test')
        expect(json['task']['sleep']).to be(9)
      end
    end
  end
end
