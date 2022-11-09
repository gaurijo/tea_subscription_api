Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/customers/:id/subscriptions', to: 'subscriptions#index'
      patch '/customers/:id/subscriptions', to: 'subscriptions#update'
      post '/subscriptions', to: 'subscriptions#create'
    end
  end
end
