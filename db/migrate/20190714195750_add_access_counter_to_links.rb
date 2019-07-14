class AddAccessCounterToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :access_counter, :integer
  end
end
