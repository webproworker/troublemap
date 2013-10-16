class AddPermalinkToCities < ActiveRecord::Migration
  def change
    add_column :cities, :permalink,  :string
  end
end
