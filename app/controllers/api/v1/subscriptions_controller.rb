class Api::V1::SubscriptionsController < ApplicationController 
  def index 
    customer = Customer.find(params[:id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def create 
    if Customer.exists?(params[:customer_id]) && Tea.exists?(params[:tea_id])
      sub1 = Subscription.create(sub_params)
      render json: SubscriptionSerializer.new(sub1), status: :created
    else 
      render status: 404
    end
  end

  def update 
    # subscription = Subscription.find(params[:id])
    if Subscription.exists?(params[:id])
      subscription = Subscription.find(params[:id])
      subscription.update(sub_params)
      render json: SubscriptionSerializer.new(subscription)
    else
      render status: 404
    end
  end

private 
  def sub_params 
    params.permit(:title, :price, :frequency, :status, :customer_id, :tea_id)
  end
end