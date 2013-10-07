class AddGmaps < ActiveRecord::Migration
  def change
    add_column :troubles, :latitude,  :float #you can change the name, see wiki
    add_column :troubles, :longitude, :float #you can change the name, see wiki
    add_column :troubles, :gmaps, :boolean #not mandatory, see wiki
  end
end
