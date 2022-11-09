Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/customers/:id/subscriptions', to: 'subscriptions#index'
      post '/subscriptions', to: 'subscriptions#create'
      patch '/subscriptions/remove', to: 'subscriptions#update'
    end
  end
end
