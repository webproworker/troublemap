class ConvertStringToText < ActiveRecord::Migration
  def self.up
   change_column :troubles, :latitude, :text
   change_column :troubles, :longitude, :text
  end

  def self.down
   change_column :troubles, :latitude, :string
   change_column :troubles, :longitude, :string
  end
end
