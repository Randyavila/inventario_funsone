class Departamento < ActiveRecord::Base
  has_many :pedidos
  validates :nombre, presence: { message: "Debe ingresar un Nombre" }
  validates :titular, presence: {message: "Debe ingresar un Titular"}
  #validates :clasificacion, presence: {message: "Debe ingresar una Ubicación"}



  def self.search(search)
    if search
      self.where("nombre like ?", "%#{search}%")
    else
      self.all
    end
  end


  def nombre=(value)
    write_attribute(:nombre, value.mb_chars.upcase)
  end

#  def titular=(value)
#    write_attribute(:titular, value.mb_chars.upcase)
#  end


end
