class EstadosController < ApplicationController
  before_action :set_estado, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  load_and_authorize_resource
  # GET /estados
  def index

    @estados = Estado.all.order('created_at DESC').page(params[:page]).per(10)

  end

  # GET /estados/1
  def show
  end

  # GET /estados/new
  def new
    @estado = Estado.new
  end

  # GET /estados/1/edit
  def edit
  end

  # POST /estados
  def create
    @estado = Estado.new(estado_params)

    if @estado.save
      redirect_to @estado, notice: 'Estado was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /estados/1
  def update
    if @estado.update(estado_params)
      redirect_to @estado, notice: 'Estado was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /estados/1
  def destroy
    @estado.destroy
    redirect_to estados_url, notice: 'Estado was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado
      @estado = Estado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estado_params
      params.require(:estado).permit(:estado)
    end
end
