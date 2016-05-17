class GruposController < ApplicationController
  before_action :set_grupo, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource


  # GET /grupos
  def index
    if params[:search]
      @grupos = Grupo.search(params[:search]).order("created_at DESC").page(params[:page]).per(7)
    else
      @grupos = Grupo.all.order('created_at DESC').page(params[:page]).per(7)
      end
    end

  # GET /grupos/1
  def show
    #@articulos = Articulo.all
    @articulos = Articulo.where(:grupos_id => params[:id])
  end

  # GET /grupos/new
  def new
    @grupo = Grupo.new
  end

  # GET /grupos/1/edit
  def edit
  end

  # POST /grupos
  def create
    @grupo = Grupo.new(grupo_params)

    if @grupo.save
      redirect_to @grupo, notice: 'Grupo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /grupos/1
  def update
    if @grupo.update(grupo_params)
      redirect_to @grupo, notice: 'Grupo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /grupos/1
  def destroy
    @grupo.destroy
    redirect_to grupos_url, notice: 'Grupo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo
      @grupo = Grupo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grupo_params
      params.require(:grupo).permit(:codgrupo, :codsubgrupo, :codseccion, :descripcion)
    end
end
