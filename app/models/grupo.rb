class Grupo < ActiveRecord::Base
  has_many :articulos
  belongs_to :articulos

  validates :codgrupo, :presence => true
  validates :codsubgrupo, :presence => true
  validates :codseccion, :presence => true


  validates :codgrupo, numericality: { only_integer: true }
  validates :codsubgrupo, numericality: { only_integer: true }
  validates :codseccion, numericality: { only_integer: true }

  def descripcion=(value)
    write_attribute(:descripcion, value.mb_chars.upcase)
  end

  def self.search(query)
  # where(:title, query) -> This would return an exact match of the query
  where("descripcion LIKE ?", "%#{query}%")
  end


  def self.mostrar(query)
  # where(:title, query) -> This would return an exact match of the query
  where("grupos_id LIKE ?", "%#{query}%")
  end

end
