class AddColumnDescripcionArticulos < ActiveRecord::Migration
  def change

    add_column :articulos, :descripcion, :string

  end
end
