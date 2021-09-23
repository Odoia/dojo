module Api
  module V1
    class UserController < ApplicationController
      before_action :user_params, only: [:create]

      def create
        result = User.new.tap do |u|
          u.name = user_params[:name]
          u.city = user_params[:city]
          u.save
        end

        render status: 201, json: { data: result }
      end

      private

      def user_params
        return render_error if params[:user].blank?

        params.require(:user).permit(:name, :city)
      end

      def render_error
        render nothing: true, status: 400
      end
    end
  end
end
