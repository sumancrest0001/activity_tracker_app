require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'User #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          user: {
            name: 'examplev1',
            email: 'example0001@gmail.com',
            password: 'suman12345',
            password_confirmation: 'suman12345'
          }
        }
      end

      it 'adds a valid user to the database' do
        expect { post :create, { params: valid_params } }.to change(User, :count).by(+1)
        expect(response).to have_http_status :ok
      end
    end
  end
end
