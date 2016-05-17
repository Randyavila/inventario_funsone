class Enviarsolicitud < ActiveRecord::Base
  belongs_to :articulo
  belongs_to :solicitud

  validates :solicitado, presence: { message: "Ingrese la cantidad solicitada" }
  validate :articulo_valido



  private
    def articulo_valido
      unless Articulo.exists?(self.articulo_id)
        errors.add(:msg, "El código #{self.articulo_id} no existe")
      end
    end

    def self.demanda_articulos
      Enviarsolicitud.group(:articulo_id).order('count(*) desc').limit(7).count
    end
end
