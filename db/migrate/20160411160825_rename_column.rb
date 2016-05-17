class RenameColumn < ActiveRecord::Migration
    def self.up
      rename_column :articulos, :codigomanuel, :codigousuario
    end
  end
