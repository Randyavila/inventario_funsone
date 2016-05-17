class AddColumnClasificacionDepartamento < ActiveRecord::Migration
  def change

    add_column :departamentos, :clasificacion, :string

  end
end
