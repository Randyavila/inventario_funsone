class AddEstadoToArticulos < ActiveRecord::Migration
  def change
    add_column :articulos, :estado, :string
  end
end
