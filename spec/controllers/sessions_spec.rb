require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'creating sessions' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          user: {
            email: 'suman@gmail.com',
            password: 'suman12345'
          }
        }
      end
      before { post :create, params: valid_params }
      it 'creats a new session for the user' do
        expect(response).to have_http_status :ok
        json = JSON.parse(response.body)
        expect(json['logged_in']).to eql(true)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          user: {
            email: 'suman.com',
            password: 'suman12345'
          }
        }
      end
      before { post :create, params: invalid_params }
      it 'should not create session for the invalid user' do
        expect(response).to have_http_status :ok
        json = JSON.parse(response.body)
        expect(json['status']).to eql(401)
      end
    end
  end

  describe 'logged_in method' do
    context 'when current_user is present' do
      it 'should return true' do
        user = User.create!(name: 'example123',
                            email: 'example123@gmail.com',
                            password: 'example123',
                            password_confirmation: 'example123')
        session[:user_id] = user.id
        get :logged_in
        json = JSON.parse(response.body)
        expect(json['logged_in']).to be(true)
      end
    end

    context 'when current_user is not present' do
      it 'should return false' do
        get :logged_in
        json = JSON.parse(response.body)
        expect(json['logged_in']).to be(false)
      end
    end
  end

  describe 'logout method' do
    before(:each) do
      get :logout
    end
    it 'should return 200 status code' do
      json = JSON.parse(response.body)
      expect(json['status']).to be(200)
    end
    it 'should return true' do
      get :logout
      json = JSON.parse(response.body)
      expect(json['logged_out']).to be(true)
    end
  end
end
