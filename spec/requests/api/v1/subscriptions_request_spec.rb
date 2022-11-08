require 'rails_helper' 

describe "Subscriptions API" do 
  it "has a list of a customer's subscriptions" do 
    gauri = Customer.create(first_name: "Gauri", last_name: "Jo", email: "gauri@gmail.com", address: "123 Test Ave, Denver, CO 12121")
    lavender = Tea.create(title: "Lavender Haze", description: "Drift off into dreamland", temp: 123, brew_time: "3 min")
    green = Tea.create(title: "Green Tea", description: "Tranquility is one sip away", temp: 123, brew_time: "5 min")
    sub1 = Subscription.create(title: "Stress Buster", price: 15.25, status: "active", frequency: "monthly", customer_id: gauri.id, tea_id: lavender.id)
    sub2 = Subscription.create(title: "Energizer", price: 20.10, status: "active", frequency: "monthly", customer_id: gauri.id, tea_id: green.id)

    get "/api/v1/customers/#{gauri.id}/subscriptions"

    subs = JSON.parse(response.body, symbolize_names: true)[:data]
    # require 'pry'; binding.pry 
    expect(response).to be_successful
    expect(subs.count).to eq(2)
    expect(subs).to be_a(Array)
    
    subs.each do |sub|
      # require 'pry'; binding.pry 
      expect(sub).to have_key(:id)
      expect(sub[:id]).to be_a(String)
      expect(sub).to have_key(:attributes)
      expect(sub[:attributes]).to be_a(Hash)
      expect(sub[:attributes]).to include(:title)
      expect(sub[:attributes]).to include(:price)
      expect(sub[:attributes]).to include(:status)
      expect(sub[:attributes]).to include(:frequency)
      expect(sub[:attributes]).to include(:customer_id)
      expect(sub[:attributes]).to include(:tea_id)
    end
  end
end