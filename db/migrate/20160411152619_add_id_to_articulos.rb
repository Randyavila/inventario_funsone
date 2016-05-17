class AddIdToArticulos < ActiveRecord::Migration
  def change
    add_column :articulos, :id, :integer
  end
end
