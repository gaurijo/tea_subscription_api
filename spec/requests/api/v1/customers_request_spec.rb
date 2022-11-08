# require 'rails_helper' 

# describe "Customers API" do 
#   it "has a list of a customer's subscriptions" do 
#     gauri = Customer.create(first_name: "Gauri", last_name: "Jo", email: "gauri@gmail.com", address: "123 Test Ave, Denver, CO 12121")
#     lavender = Tea.create(title: "Lavender Haze", description: "Drift off into dreamland", temp: 123, brew_time: "3 min")
#     green = Tea.create(title: "Green Tea", description: "Tranquility is one sip away", temp: 123, brew_time: "5 min")
#     sub1 = Subscription.create(title: "Stress Buster", price: 15.25, status: "active", frequency: "monthly", customer_id: gauri.id, tea_id: lavender.id)
#     sub2 = Subscription.create(title: "Energizer", price: 20.10, status: "active", frequency: "monthly", customer_id: gauri.id, tea_id: green.id)

#     get "/api/v1/customers/#{gauri.id}/subscriptions"

#     expect(response).to be_successful

#     response_body = JSON.parse(response.body, symbolize_names: true)
#     subs = response_body[:data]

#     subs.each do |sub|
#       expect(sub).to have_key(:id)
#     end
#   end
# end