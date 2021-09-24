require 'rails_helper'

describe UserController, type: :request do

  let(:valid_params) do
    {
      user: {
        name: 'valid name',
        city: 'valid city',
        birth_date: '1991-10-10'
      }
    }
  end

  let(:invalid_params) { { name: 'valid name', city: 'valid city' } }

  let(:header) { { 'ACCEPT' => 'application/json' } }

  let(:call) do
    post '/api/v1/user', params: params, headers: header
  end

  context 'when create a new user' do
    context 'when use a post request' do
      context 'when pass valid params' do
        let(:params) { valid_params }
        it 'must return 201' do
          call
          expect(response.status).to eq 201
        end

        it 'must return a created user' do
          call
          result = JSON.parse(response.body)['data']
          expect(result['id']).to eq 1
          expect(result['name']).to eq 'valid name'
          expect(result['city']).to eq 'valid city'
          expect(result['birth_date']).to eq '10/10/1991'
        end

        it 'must user count in database is 1' do
          call
          expect(User.count).to eq 1
        end

        it 'must return a age' do
          call
          result = JSON.parse(response.body)['data']
          expect(result['age']).to eq '30'
        end
      end

      context 'when pass invalid params' do
        let(:params) { invalid_params }
        xit 'must return 400' do
          call
          expect(response.status).to eq 400
        end
      end
    end
  end
end
