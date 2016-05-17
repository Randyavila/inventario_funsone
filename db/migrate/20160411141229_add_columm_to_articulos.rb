class AddColummToArticulos < ActiveRecord::Migration
  def change
    add_columm :articulos, :codigomanuel, :integer
  end
end
