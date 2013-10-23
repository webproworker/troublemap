class ChangeLatLongFormatInTroubles < ActiveRecord::Migration
  def up
   change_column :troubles, :latitude, :decimal
   change_column :troubles, :longitude, :decimal
  end

  def down
   change_column :troubles, :latitude, :float
   change_column :troubles, :longitude, :float
  end
end
