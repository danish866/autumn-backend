module Api
  module V1
    class ChallangesController < ApplicationController
      before_action :authenticate_user!, only: [:create, :update, :destroy]
      before_action :set_challange, only: [:show, :update, :destroy]

      def index
        challanges = Challange.all
        render json: challanges
      end
      
      def create
        challange = current_user.challanges.build(challange_params)
        if challange.save
          render json: challange, status: :created
        else
          render json: { errors: challange.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: @challange
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Challange not found' }, status: :not_found 
      end

      def update
        if @challange.update(challange_params)
          render json: @challange
        else
          render json: { errors: @challange.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Challange not found' }, status: :not_found
      end

      def destroy
        if @challange.destroy
          render json: { message: 'Challange deleted successfully' }, status: :ok
        else
          render json: { errors: challange.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Challange not found' }, status: :not_found
      end

      private

      def set_challange
        @challange = Challange.find(params[:id])
      end

      def challange_params
        params.require(:challange).permit(:title, :description, :start_date, :end_date)
      end
    end
  end
end
