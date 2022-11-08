# require 'rails_helper' 

# describe "Subscriptions API" do 
#   it 'has a list of customer subscriptions' do 
#     gauri = Customer.create(first_name: "Gauri", last_name: "Jo", email: "gauri@gmail.com", address: "123 Test Ave, Denver, CO 12121")
#     lavender = Tea.create(title: "Lavender Haze", description: "Drift off into dreamland", temp: 123, brew_time: "3 min")
#     sub1 = Subscription.create(title: "Stress Buster", price: 15.25, status: "active", frequency: "monthly", customer_id: gauri.id, tea_id: lavender.id)

#     get "/api/v1/subscriptions/#{sub1.id}"
#   end
# end