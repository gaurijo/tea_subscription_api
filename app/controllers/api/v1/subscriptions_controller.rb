class Api::V1::SubscriptionsController < ApplicationController 
  def index 
    customer = Customer.find(params[:id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def create 
    sub = Subscription.new(sub_params)
    # if sub.save
    if Customer.exists?(params[:customer_id]) && Tea.exists?(params[:tea_id])
      # if Customer.find(params[:customer_id]) && Tea.find(params[:tea_id])
      render json: SubscriptionSerializer.new(sub), status: :created
    else 
      render status: 404
    end
  end
  # def destroy
  #   subscription = Subscription.find(params[:id], params[:customer_id])
  # end
private 
  def sub_params 
    params.permit(:title, :price, :frequency, :status, :customer_id, :tea_id)
  end
end