require '../lib/vehicle.rb'
describe "Vehiculo" do
  before :all do
    @e1 = Emisiones.new(3, 5, 6, 2);
    @e2 = Emisiones.new(3, 6, 4, 2);
    @v1 = Vehicle.new(12345, "Coche", 5, 9000, @e1);
    @v2 = Vehicle.new(12346, "Camion", 7, 13000, @e1);
    @v3 = Vehicle.new(12347, "Coche", 5, 10000, @e2);
    @p1 = Parking.new([@v1, @v2, @v3]);
  end

  describe "Pruebas de constructor Vehiculo" do
    it "Constructor no nulo" do
      expect(@v1).not_to eq(nil);
    end
  end

  describe "Atributos vehicle" do
    it "Atributo id" do
      expect(@v1.id).to eq(12345);
    end

    it "Atributo tipo" do
      expect(@v1.tipo).to eq("Coche");
    end

    it "Atributo número de plazas" do
      expect(@v1.n_plazas).to eq(5);
    end

    it "Atributo precio" do
      expect(@v1.precio).to eq(9000);
    end

    it "Atributo emisiones" do
      expect(@v1.emisiones).to eq(@e1);
    end
  end

  describe "Función to_s" do
    it "def to_s" do
      expect(@v1.to_s).to eq("Id: 12345, Tipo: Coche, Número de plazas: 5, Precio: 9000")
    end
  end

  describe "Función Vehiculos" do
    it "def modificacion precio" do
      expect(@v1.mod_precio()).to eq(144000)
    end
  end

  describe "Pruebas de constructor Emisiones" do
    it "Constructor no nulo" do
      expect(@e1).not_to eq(nil);
    end
  end

  describe "Atributos emisiones" do
    it "Atributos co2" do
      expect(@e1.co2).to eq(3);
    end

    it "Atributos co" do
      expect(@e1.co).to eq(5);
    end
    
    it "Atributos nox" do
      expect(@e1.nox).to eq(6);
    end

    it "Atributos hc" do
      expect(@e1.hc).to eq(2);
    end
  end 

  describe "Función to_s" do
    it "def to_s" do
      expect(@e1.to_s).to eq("Co2: 3, Co: 5, Nox: 6, Hc: 2");
    end
  end

  describe "Metodos emisiones" do
    it "Funcion indicador contaminacion" do
      expect(@e1.indicador_contaminacion()).to eq(16);
    end

    it "Funcion indicador contaminacion" do
      expect(@e2.indicador_contaminacion()).to eq(15);
    end

  end

  

  describe "Pruebas de constructor Parking" do
    it "Atributo vehiculo" do
      expect(@p1.vehiculos).to eq([@v1, @v2, @v3]);
    end
  end

  describe "Metodos Parking" do
    it "Función mínimo contaminante" do
      expect(@p1.min_contaminante()).to eq([@v3]);
    end
  end
end