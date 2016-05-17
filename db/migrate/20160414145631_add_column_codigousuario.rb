class AddColumnCodigousuario < ActiveRecord::Migration
  def change

    add_column :articulos, :codigousuario, :integer


  end
end
