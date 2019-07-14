class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :initial_link
      t.string :shorted_link
      t.string :info
      t.integer :access_counter

      t.timestamps
    end
  end
end
