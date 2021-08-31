class RemoveLongFromVenue < ActiveRecord::Migration[6.0]
  def change
    remove_column :venues, :long, :float
  end
end
