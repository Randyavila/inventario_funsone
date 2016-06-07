class SolicitudPdf < Prawn::Document
  def initialize(solicitud)
    super()
    @solicitud = solicitud
    @nunsolicitud_solicitud = @solicitud.nunsolicitud.to_s
    header
    body
    footer
  end

  def header
    image "#{Rails.root}/app/assets/images/logo_funsone.png", width: 140, height: 80, :at => [0, 740]
    image "#{Rails.root}/app/assets/images/index.jpeg", width: 140, height: 102, :at => [400,740]

    draw_text "Dirección de Recursos Materiales", :at => [185,660]
  end

  def body
    move_down 80
    table_content
  end

  def footer
    draw_text @solicitud.user.nombre + " " + @solicitud.user.apellidos, :at => [10, 28]
    draw_text "_________________________________", :at => [10, 25]
    draw_text "Firma del Solicitante", :at => [55, 12]

    #draw_text @solicitud.departamento.titular, :at => [310, 28]
    draw_text "_________________________________", :at => [310, 25]
    draw_text "Firma del Responsable De Almacén", :at => [325, 12]
  end

  def table_content
    table articulos_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      row(2).font_style = :bold
      row(2).background_color = 'dbdee2'
      row(4).font_style = :bold
      row(4).background_color = 'dbdee2'
      self.header = true
      self.cell_style = {size: 10, border_color: 'd6d8db'}
      self.column_widths = [140, 300, 90, ]
    end
  end

  def articulos_rows
    [ [{:content => "Titular", :colspan =>2}, {:content => "Número de Orden", :colspan => 2}],
      [{:content => @solicitud.departamento.titular, :colspan => 2}, {:content => @nunsolicitud_solicitud, :colspan => 2}],
      [{:content => "Departamento", :colspan =>2}, {:content => "Fecha", :colspan => 2}],
      [{:content => @solicitud.departamento.nombre, :colspan => 2}, {:content => @solicitud.created_at.strftime("%d/%m/%Y"), :colspan => 2}],
      [{:content => "Articulos Solicitados", :colspan => 4}],
      ['Código', 'Descripción', 'Solicitado' ] ] +
      @solicitud.enviarsolicituds.map do |detalles_solicitud|
      [detalles_solicitud.articulo_id, detalles_solicitud.articulo.descripcion, detalles_solicitud.solicitado.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse]
    end
  end
end
