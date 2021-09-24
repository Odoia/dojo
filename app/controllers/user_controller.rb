class UserController < ApplicationController

  def create
    user = params[:user]

    result = User.new.tap do |u|
      u.birth_date = user[:birth_date]
      u.name = user[:name]
      u.city = user[:city]
      u.save
    end

    binding.pry

    result_as_json = JSON.parse(result)

    binding.pry
    render :json => { data: result.as_json }, :status => 201
  end
end
