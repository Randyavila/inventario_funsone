class ArticulosPdf < Prawn::Document
  def initialize(articulos)
    super()
    @articulos = articulos
    header
    body
  end

  def header
    image "#{Rails.root}/app/assets/images/logo_funsone.png", width: 140, height: 80, :at => [0, 740]
    image "#{Rails.root}/app/assets/images/index.jpeg", width: 140, height: 90, :at => [400,740]

    draw_text "Dirección de Recursos Materiales", :at => [185,660]
  end

  def body
    move_down 90
    table_content
  end

  def table_content
    table articulos_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      self.cell_style = {size: 9, border_color: 'd6d8db'}
      self.column_widths = [38, 54, 44 ,59, 85, 49, 90, 65, 55]
    end
  end


  def articulos_rows
    [ [{:content => "Total de Artículos en Inventario", :colspan =>9}],
      ['Grupo', 'SubGrupo', 'Sección','Código del Bien', 'Descripción', 'Cantidad', 'Ubicación', 'Estado', 'Valor Monetario'] ] +
      @articulos.map do |articulo|
        @q=Grupo.find(articulo.grupos_id)
        @a=Estado.find(articulo.estados_id)
        @b=Departamento.find(articulo.departamento_id)

      [@q.codgrupo,@q.codsubgrupo,@q.codseccion,articulo.codigousuario, articulo.descripcion, articulo.existencia.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse, @b.nombre, @a.estado, articulo.valor]
    end
  end

end
