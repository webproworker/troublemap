class ChangeLatLongPrecisionScaleInTroubles < ActiveRecord::Migration
  def self.up
   change_column :troubles, :latitude, :decimal, :precision => 16, :scale => 14
   change_column :troubles, :longitude, :decimal, :precision => 16, :scale => 14
  end

  def self.down
   change_column :troubles, :latitude, :decimal
   change_column :troubles, :longitude, :decimal
  end
end
