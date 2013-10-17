class RemoveCityFromTroubles < ActiveRecord::Migration
  def change
    remove_column :troubles, :city, :string
  end
end
