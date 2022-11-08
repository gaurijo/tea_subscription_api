Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/customers/:id/subscriptions', to: 'subscriptions#index'
      post '/subscriptions', to: 'subscriptions#create'
      # delete '/customers/:id/subscriptions/:id', to: 'subscriptions#destroy'
    end
  end
end
