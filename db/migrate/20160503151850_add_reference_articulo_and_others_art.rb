class AddReferenceArticuloAndOthersArt < ActiveRecord::Migration
  def change

    add_reference :solicituds, :user, index: true
    add_reference :solicituds, :departamento, index: true



  end
end
