class AddValorToArticulos < ActiveRecord::Migration
  def change
    add_column :articulos, :valor, :integer
  end
end
