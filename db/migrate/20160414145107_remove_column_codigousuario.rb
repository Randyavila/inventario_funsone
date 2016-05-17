class RemoveColumnCodigousuario < ActiveRecord::Migration
  def change
    remove_column :articulos, :codigousuario
  end
end
