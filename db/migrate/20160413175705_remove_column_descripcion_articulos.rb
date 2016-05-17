class RemoveColumnDescripcionArticulos < ActiveRecord::Migration
  def change

    remove_column :articulos, :descripcion

  end
end
