class AddIndexOnTroubles < ActiveRecord::Migration
  def change
    add_reference :troubles, :city, index: true
  end
end
