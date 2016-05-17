class DropTableEstado < ActiveRecord::Migration
  def change
    drop_table :table_estados
  end
end
