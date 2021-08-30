class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.int :capacity
      t.string :location
      t.float :lat
      t.float :long
      t.datetime :available_dates
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
