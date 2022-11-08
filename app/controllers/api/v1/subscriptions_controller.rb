class Api::V1::SubscriptionsController < ApplicationController 
  def index 
    render json: SubscriptionSerializer.new(params[:customer_id])
  end
end