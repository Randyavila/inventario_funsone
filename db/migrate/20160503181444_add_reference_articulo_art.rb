class AddReferenceArticuloArt < ActiveRecord::Migration
  def change

    add_reference :solicituds, :articulos, index: true


  end
end
