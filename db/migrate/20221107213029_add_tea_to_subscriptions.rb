class AddTeaToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :tea, foreign_key: true
  end
end
