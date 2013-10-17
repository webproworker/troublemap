class RemovePermalinkFromCities < ActiveRecord::Migration
  def change
    remove_column :cities, :permalink, :string
  end
end
