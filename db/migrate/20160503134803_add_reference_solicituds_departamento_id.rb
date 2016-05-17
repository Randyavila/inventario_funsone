class AddReferenceSolicitudsDepartamentoId < ActiveRecord::Migration
  def change

    add_reference :solicituds, :departamento, index: true


  end
end
