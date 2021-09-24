Rails.application.routes.draw do

  post '/api/v1/user' => 'user#create'
end
