class Articulo < ActiveRecord::Base
  has_many :enviarpedidos
  has_many :pedidos, through: :enviarpedidos

  belongs_to :grupos


  validates :descripcion, :presence => true
  validates :existencia, :presence => true
  validates :valor, :presence => true

  validates :descripcion, presence: { message: "Debe ingresar una descripción" }
  validates :existencia, presence: { message: "Debe ingresar una cantidad" }
  validates :codigousuario, presence: { message: "Debe ingresar un código del bien" }
  validates :valor, presence: { message: "Debe ingresar un valor monetario" }


  validates :existencia, numericality: { only_integer: true }



  def self.search(query)
  # where(:title, query) -> This would return an exact match of the query
  where("descripcion like ?", "%#{query}%")
  end

  def descripcion=(value)
    write_attribute(:descripcion, value.mb_chars.upcase)
  end

  def estado=(value)
    write_attribute(:estado, value.mb_chars.upcase)
  end


  private
    def self.disponibilidad(status)
      if status == "disponible"
        Articulo.where("existencia > ?", 0).count
      elsif status == "agotado"
        Articulo.where("existencia <= ?", 0).count
      end
    end
end
