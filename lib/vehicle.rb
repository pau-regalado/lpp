class Emisiones
  attr_accessor :co2, :co, :nox, :hc
  def initialize co2, co, nox, hc
    @co2 = co2;
    @co = co;
    @nox = nox;
    @hc = hc;
  end

  def to_s
    "Co2: #{co2}, Co: #{co}, Nox: #{nox}, Hc: #{hc}"
  end

  def indicador_contaminacion
    return @co2 + @co + @nox + @hc
  end
end


class Vehicle
  attr_accessor :id, :tipo, :n_plazas, :precio, :emisiones

  def initialize id, tipo, n_plazas, precio, emisiones
    @id = id;
    @tipo = tipo;
    @n_plazas = n_plazas;
    @precio = precio;
    @emisiones = emisiones;
  end

  def to_s
    "Id: #{id}, Tipo: #{tipo}, Número de plazas: #{n_plazas}, Precio: #{precio}"
  end

  def mod_precio 
    @precio * @emisiones.indicador_contaminacion()
  end

end

class Parking
  attr_accessor :vehiculos
  def initialize vehiculos
    @vehiculos = vehiculos;
  end

  def min_contaminante 
    min = @vehiculos.collect{ |x| x.emisiones.indicador_contaminacion() }.min
    @vehiculos.select{|x| x.emisiones.indicador_contaminacion() == min}
  end

  def mod_precio 
    @vehiculos.collect{ |x| x.mod_precio() }
  end
  
end

