class RemoveLatFromVenue < ActiveRecord::Migration[6.0]
  def change
    remove_column :venues, :lat, :float
  end
end
