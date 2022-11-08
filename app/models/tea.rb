class Tea < ApplicationRecord
  validates_presence_of :title 
  validates_presence_of :description
  validates_presence_of :temp
  validates_presence_of :brew_time
end
