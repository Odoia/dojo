require 'rails_helper'

describe Api::V1::UserController, type: :request do

  context 'when show all users' do
    context 'when use a get request' do
      context 'when has 9 user in database' do

        let(:header) { { 'ACCEPT' => 'application/json' } }

        let!(:call) do
          for i in 1..9
            params = {
              user: {
                name: "valid name #{i}",
                city: "valid city #{i}",
                birth_date: "1991-10-#{i}"
              }
            }
            post '/api/v1/user', params: params, headers: header
          end
        end

        xit 'must return a 200 status' do
          get '/api/v1/user'
          expect(response.status).to eq 200
        end

        xit 'must return a user array with 2 users' do
          get '/api/v1/user'
          result = JSON.parse(response.body)['data']
          expect(result.count).to eq 9
        end
      end

      context 'when dont have user in database' do
        xit 'must return 200' do
          get '/api/v1/user'
          expect(response.status).to eq 200
        end

        xit 'must return an empty array' do
          get '/api/v1/user'
          result = JSON.parse(response.body)['data']
          expect(result).to eq []
        end
      end
    end
  end
end
