require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "validations" do 
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :status }
    it { should define_enum_for(:status).with_values([:active, :canceled])}
    it { should validate_presence_of :frequency }
  end

  describe "relationships" do 
    it { should belong_to :customer }
    it { should belong_to :tea }
  end
end
