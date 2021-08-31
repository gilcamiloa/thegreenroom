class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_band, :boolean
    add_column :users, :band_name, :string
    add_column :users, :band_description, :text
  end
end
