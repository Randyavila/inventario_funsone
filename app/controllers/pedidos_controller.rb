class PedidosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    if params[:search]
      @pedidos = Pedido.search(params[:search]).order("created_at ASC").page(params[:page]).per(7)
    else
      @pedidos = Pedido.all.order('created_at DESC').page(params[:page]).per(7)
    end
  end


  def show
    @pedido = Pedido.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PedidoPdf.new(@pedido)
        send_data pdf.render, filename: 'pedido.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def new
    #@codigo = Pedido.buscar_numero
    @pedido = Pedido.new
    @pedido.enviarpedidos.build

  end

  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.codigo = Pedido.generar_folio
    if @pedido.save
      redirect_to @pedido
    else
      render 'new'
    end
  end

  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy
    redirect_to pedidos_path
  end

  private
    def pedido_params
      params.require(:pedido).permit(:codigo, :departamento_id, :user_id, enviarpedidos_attributes: [:solicitado, :surtido, :articulo_id])
    end
end
