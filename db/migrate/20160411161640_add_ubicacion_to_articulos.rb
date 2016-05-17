class AddUbicacionToArticulos < ActiveRecord::Migration
  def change
    add_column :articulos, :ubicacion, :string
  end
end
