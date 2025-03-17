module Api
  module V1
    class ChallangesController < ApplicationController

      def index
        challanges = Challange.all
        render json: challanges
      end
      
      def create
        challange = Challange.new(challange_params)
        if challange.save
          render json: challange, status: :created
        else
          render json: { errors: challange.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show 
      end
      def update;end
      def destroy;end

      private
      def challange_params
        params.require(:challange).permit(:title, :description, :start_date, :end_date)
      end
    end
  end
end
