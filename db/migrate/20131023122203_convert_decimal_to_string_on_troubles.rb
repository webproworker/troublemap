class ConvertDecimalToStringOnTroubles < ActiveRecord::Migration
  def self.up
   change_column :troubles, :latitude, :string
   change_column :troubles, :longitude, :string
  end

  def self.down
   change_column :troubles, :latitude, :decimal, :precision => 16, :scale => 14
   change_column :troubles, :longitude, :decimal, :precision => 16, :scale => 14
  end
end
