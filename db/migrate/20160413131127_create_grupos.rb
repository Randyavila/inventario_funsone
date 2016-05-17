class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.integer :codgrupo
      t.integer :codsubgrupo
      t.integer :codseccion
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
