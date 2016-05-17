class SolicitudsController < ApplicationController
before_action :authenticate_user!


  def index
    if params[:search]
      @solicituds = Solicitud.search(params[:search]).order("created_at ASC").page(params[:page]).per(7)
    else
      @solicituds = Solicitud.all.order('created_at DESC').page(params[:page]).per(7)
    end
  end


  def show
    authorize! :read, @solicitud
    @solicitud = Solicitud.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = SolicitudPdf.new(@solicitud)
        send_data pdf.render, filename: 'solicitud.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def new
    #@codigo = Pedido.buscar_numero
    @solicitud = Solicitud.new
    @solicitud.enviarsolicituds.build

  end

  def create
    authorize! :create, @solicitud
    @solicitud = Solicitud.new(solicitud_params)
    @solicitud.nunsolicitud = Solicitud.generar_folio
    if @solicitud.save
      redirect_to @solicitud
    else
      render 'new'
    end
  end

  def destroy
    authorize! :destroy, @solicitud
    @solicitud = Solicitud.find(params[:id])
    @solicitud.destroy
    redirect_to solicituds_path
  end

  private
    def solicitud_params
      params.require(:solicitud).permit(:nunsolicitud, :departamento_id, :user_id, enviarsolicituds_attributes: [:solicitado, :articulo_id, :grupos_id])
    end
end
