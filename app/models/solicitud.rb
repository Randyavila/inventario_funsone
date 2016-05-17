class Solicitud < ActiveRecord::Base
  has_many :enviarsolicituds, dependent: :destroy
  has_many :articulos, through: :enviarsolicituds
  belongs_to :departamento
  belongs_to :user

  validates :departamento_id, presence: { message: "Debe seleccionar un Titular" }
  validates :departamento_id, presence: true

  accepts_nested_attributes_for :enviarsolicituds, :reject_if => lambda { |c| c[:articulo_id].blank?}


  def self.search(query)
  # where(:title, query) -> This would return an exact match of the query
  where("nunsolicitud like ?", "%#{query}%")
  end


  private
    def self.generar_folio
      time, numero_random = Time.new, Random.new
      orden = time.strftime("%Y%m%d") + "#{numero_random.rand(100)}"
      if Solicitud.exists?(nunsolicitud: orden)
        generar_folio
      else
        orden
      end
    end

   def self.recientes
      Solicitud.order("created_at DESC").limit(10)
    end

end
