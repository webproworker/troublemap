class CreateTroubles < ActiveRecord::Migration
  def change
    create_table :troubles do |t|
      t.string :name
      t.string :city
      t.text :location
      t.text :description

      t.timestamps
    end
  end
end
