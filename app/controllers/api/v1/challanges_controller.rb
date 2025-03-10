module Api
  module V1
    class ChallangesController < ApplicationController

      def index
        challanges = Challange.all
        render json: challanges
      end
      
      def create;end
      def show;end
      def update;end
      def destroy;end
    end
  end
end
