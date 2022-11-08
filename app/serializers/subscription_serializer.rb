class SubscriptionSerializer 
  include JSONAPI::Serializer 
  attributes :title, :price, :status, :customer_id, :tea_id
end