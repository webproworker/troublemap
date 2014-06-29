class AddSeverityToTroubles < ActiveRecord::Migration
  def change
    add_column :troubles, :severity, :string
  end
end
