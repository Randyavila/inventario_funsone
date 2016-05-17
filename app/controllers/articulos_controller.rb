class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:show]
  before_action :authenticate_user!

  load_and_authorize_resource
  #load_and_authorize_resource :nested => :articulos

  def index
    if params[:search]
      @articulos = Articulo.search(params[:search]).order("created_at DESC").page(params[:page]).per(5)
     else
      @articulos = Articulo.order('created_at DESC').page(params[:page]).per(100)
        end


    respond_to do |format|
      format.html
      format.pdf do
        pdf = ArticulosPdf.new(@articulos)
        send_data pdf.render, filename: 'articulos.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def show
    #@articulos = Articulo.where(:grupos_id => params[:articulos_id])

  end

  def new
    @articulo = Articulo.new
  end

  def create
    @articulo = Articulo.new(articulo_params)
    if @articulo.save
      redirect_to @articulo, notice: 'articulo creado'
    else
      render 'new'
    end
  end

  def edit
    @articulo = Articulo.find(params[:id])
  end

  def update
    @articulo = Articulo.find(params[:id])
    if @articulo.update(articulo_params)
      redirect_to @articulo
    else
      render 'edit'
    end
  end

  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy
    redirect_to articulos_path
  end

  private
    def set_articulo
      @articulo = Articulo.find(params[:id])
    end

    def articulo_params
      params.require(:articulo).permit(:grupos_id, :codigousuario, :descripcion, :existencia, :departamento_id, :ubicacion, :valor, :estados_id)
    end


end
