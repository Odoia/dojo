class UserController < ApplicationController

  def create
    return error unless params[:user].present?
    user = params[:user]

    result = User.new.tap do |u|
      u.birth_date = user[:birth_date]
      u.name = user[:name]
      u.city = user[:city]
      u.save
    end

    render :json => { data: result.as_json }, :status => 201
  end

  def error
    render :status => 400
  end

end
