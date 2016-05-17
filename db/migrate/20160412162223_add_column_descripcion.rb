class AddColumnDescripcion < ActiveRecord::Migration
  def change
    add_column :grupos, :descripcion, :string

  end
end
