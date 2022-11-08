class Subscription < ApplicationRecord
  validates_presence_of :title 
  validates_presence_of :price 
  validates_presence_of :status 
  enum status: { active: 0, canceled: 1 }
  validates_presence_of :frequency
  belongs_to :customer 
  belongs_to :tea 
end
