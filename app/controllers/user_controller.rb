class UserController < ApplicationController

  def create
    user = params[:user]
    
    result = User.new.tap do |u|
      binding.pry
      u.birth_date = Date.parse(user[:birth_date]).strftime('%d/%m/%Y')
      u.name = user[:name]
      u.city = user[:city]
      u.save
    end


    render :json => { data: result.as_json }, :status => 201
  end
end
