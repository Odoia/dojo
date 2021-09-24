require 'rails_helper'

describe UserController, type: :request do

  context 'when show an specific users' do
    context 'when use a get request' do
      context 'when pass a valid id' do

        let(:header) { { 'ACCEPT' => 'application/json' } }

        let!(:call) do
          params = {
            user: {
              name: "valid name",
              city: "valid city",
              birth_date: "1991-10-10"
            }
          }
          post '/api/v1/user', params: params, headers: header
        end

        xit 'must return a 200 status' do
          get '/api/v1/user/1'
          expect(response.status).to eq 200
        end

        xit 'must return a correct user' do
          get '/api/v1/user/1'
          result = JSON.parse(response.body)['data']
          expect(result['id']).to eq 1
          expect(result['name']).to eq 'valid name'
          expect(result['city']).to eq 'valid city'
          expect(result['birth_date']).to eq '1991-10-10'
          expect(result['age']).to eq '30'
        end
      end

      context 'when dont have user in database' do
        xit 'must return 404' do
          get '/api/v1/user/1'
          expect(response.status).to eq 404
        end
      end
    end
  end
end
