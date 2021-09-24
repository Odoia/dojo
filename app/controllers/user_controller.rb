class UserController < ApplicationController

  def create

    render :json => { data: { id: 1, name: 'valid name', city: 'valid city', birth_date: '10/10/1991'} }, :status => 201
  end
end
