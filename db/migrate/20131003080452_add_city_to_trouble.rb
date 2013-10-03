class AddCityToTrouble < ActiveRecord::Migration
  def change
    add_column :troubles, :city, :string
  end
end
