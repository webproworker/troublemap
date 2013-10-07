class AddAddress < ActiveRecord::Migration
  def change
    add_column :troubles, :address,  :string
  end
end
