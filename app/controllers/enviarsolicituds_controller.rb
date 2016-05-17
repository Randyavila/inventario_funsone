class EnviarsolicitudsController < ApplicationController

  def create
    @solicitud = Solicitud.new
    @solicitud_articulo = @Solicitud.enviarsolicituds.find(solicitud_params)
    @Solicitud.save
  end

  private
    def solicitud_params
      params.require(:enviarsolicitud).permit(:solicitado, :departamento_id, :user_id, :grupos_id)
    end

end
