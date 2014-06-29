class RemoveLocationFromTroubles < ActiveRecord::Migration
  def change
    remove_column :troubles, :location, :text
  end
end
