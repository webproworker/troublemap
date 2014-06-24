class AddAuthorToTrouble < ActiveRecord::Migration
  def change
    add_column :troubles, :author, :string
  end
end
