class AddStringCodigodelbien < ActiveRecord::Migration
  def change
    change_column :articulos, :codigousuario, :string

  end
end
