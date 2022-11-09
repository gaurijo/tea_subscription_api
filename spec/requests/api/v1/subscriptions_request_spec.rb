require 'rails_helper' 

describe "Subscriptions API" do 
  it "has a list of a customer's subscriptions" do 
    gauri = Customer.create(first_name: "Gauri", last_name: "Jo", email: "gauri@gmail.com", address: "123 Test Ave, Denver, CO 12121")
    lavender = Tea.create(title: "Lavender Haze", description: "Drift off into dreamland", temp: 123, brew_time: "3 min")
    green = Tea.create(title: "Green Tea", description: "Tranquility is one sip away", temp: 123, brew_time: "5 min")
    sub1 = Subscription.create(title: "Stress Buster", price: 15.25, status: "active", frequency: "monthly", customer_id: gauri.id, tea_id: lavender.id)
    sub2 = Subscription.create(title: "Energizer", price: 20.10, status: 0, frequency: "monthly", customer_id: gauri.id, tea_id: green.id)

    get "/api/v1/customers/#{gauri.id}/subscriptions"
    # require 'pry'; binding.pry 
    subs = JSON.parse(response.body, symbolize_names: true)[:data]
    
    expect(response).to be_successful
    expect(subs.count).to eq(2)
    expect(subs).to be_a(Array)
    
    subs.each do |sub|
      # require 'pry'; binding.pry 
      expect(sub).to have_key(:id)
      expect(sub[:id]).to be_a(String)
      expect(sub[:type]).to eq("subscription")
      expect(sub).to have_key(:attributes)
      expect(sub[:attributes]).to be_a(Hash)
      expect(sub[:attributes]).to include(:title)
      expect(sub[:attributes]).to include(:price)
      expect(sub[:attributes]).to include(:status)
      expect(sub[:attributes][:status]).to be_a(String)
      expect(sub[:attributes]).to include(:frequency)
      expect(sub[:attributes]).to include(:customer_id)
      expect(sub[:attributes]).to include(:tea_id)
    end
  end

  it "can create or subscribe a customer to a subscription" do 
    gauri = Customer.create(first_name: "Gauri", last_name: "Jo", email: "gauri@gmail.com", address: "123 Test Ave, Denver, CO 12121")
    maroon = Tea.create(title: "Maroon Hibiscus", description: "Floral and relaxing", temp: 123, brew_time: "3 min")
    # new_sub = Subscription.create(title: "Sleepy Time", price: 10.15, status: "active", frequency: "weekly", customer_id: gauri.id, tea_id: maroon.id)
    result = {title: "Sleepy Time", 
              price: 10.15, 
              status: "active", 
              frequency: "weekly", 
              customer_id: gauri.id,
              tea_id: maroon.id }

    headers = { "CONTENT_TYPE" => "application/json", "Accept" => "application/json"}

    post "/api/v1/subscriptions", headers: headers, params: JSON.generate(result)
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(result).to be_a(Hash)
    expect(result).to have_key(:title)
    expect(result).to have_key(:price)
    expect(result).to have_key(:status)
    expect(result).to have_key(:frequency)
    expect(result).to have_key(:customer_id)
    expect(result).to have_key(:tea_id)
    expect(result[:title]).to eq("Sleepy Time")
    expect(result[:price]).to eq(10.15)
    expect(result[:status]).to eq("active")
    expect(result[:frequency]).to eq("weekly")
    expect(result[:customer_id]).to eq(gauri.id)
    expect(result[:tea_id]).to eq(maroon.id)
  end

  it "renders a status 404 error if bad data is passed through" do 
    gauri = Customer.create(first_name: "Gauri", last_name: "Jo", email: "gauri@gmail.com", address: "123 Test Ave, Denver, CO 12121")
    maroon = Tea.create(title: "Maroon Hibiscus", description: "Floral and relaxing", temp: 123, brew_time: "3 min")

    bad_result = {title: "Another Sub", 
                  price: 10.15, 
                  status: "active", 
                  frequency: "weekly", 
                  customer_id: 5, 
                  tea_id: maroon.id}

    headers = { "CONTENT_TYPE" => "application/json", "Accept" => "application/json"}

    post "/api/v1/subscriptions", headers: headers, params: JSON.generate(bad_result)

    expect(response).to_not be_successful 
    expect(response.status).to eq(404)
  end

  it "can delete a customer's subscription" do 
    gauri = Customer.create(first_name: "Gauri", last_name: "Jo", email: "gauri@gmail.com", address: "123 Test Ave, Denver, CO 12121")
    lavender = Tea.create(title: "Lavender Haze", description: "Drift off into dreamland", temp: 123, brew_time: "3 min")
    sub1 = Subscription.create(title: "Stress Buster", price: 15.25, status: "active", frequency: "monthly", customer_id: gauri.id, tea_id: lavender.id)

    sub_params = { id: sub1.id, status: "canceled" }
    headers = { "CONTENT_TYPE" => "application/json" }

    patch "/api/v1/customers/#{gauri.id}/subscriptions", headers: headers, params: JSON.generate(subscription: sub_params)
    subscription = Subscription.find_by(id: sub1.id)

    expect(response).to be_successful
  end
end