class HomeController < ApplicationController
  def index
    @articulos_disponibles = Articulo.disponibilidad("disponible")
    @articulos_agotados = Articulo.disponibilidad("agotado")
    @articulos_demanda = Enviarpedido.demanda_articulos
    @ultimos_pedidos = Pedido.recientes
    @total_pedidos = Pedido.count
    @total_estados = Estado.count
    @ultimas_solicituds = Solicitud.recientes
    @total_solicituds = Solicitud.count
    @total_departamentos = Departamento.count
    @total_grupos= Grupo.count
  end
end
