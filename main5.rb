require 'faker'
class Galleta
	
	#Metodos accesores
	attr_accessor :color, :recubrimiento, :masa, :precio

	#Constructor
	def initialize(color, recubrimiento, masa, precio)
		@color = color
		@recubrimiento = recubrimiento
		@masa = masa
		@decoracion = []
		@precio = precio
	end

	# Metodos
	def agregar_decoracion(ingrediente)
		@decoracion.push(ingrediente)
	end
end

class PaqueteGalletas
	
	attr_accessor :material_de_almacenaje, :fecha_de_fabricacion, :peso, :cantida_de_galletas, :precio, :margen_de_rentabilida, :precio_total
	
	def initialize(material_de_almacenaje, fecha_de_fabricacion, peso, margen_de_rentabilida)
		@material_de_almacenaje = material_de_almacenaje
		@fecha_de_fabricacion = fecha_de_fabricacion
		@peso = peso
		@cantida_de_galletas = 0
		@precio_total = nil
		@galletas = []
		@margen_de_rentabilida = margen_de_rentabilida
	end

	def agregar_galleta(galleta)
		@galletas.push(galleta)
		contar
	end

	def definir_costo
		costo_bruto_de_galletas = @galletas.sum{|galleta| galleta.precio}
		@precio_total = costo_bruto_de_galletas * (1 + @margen_de_rentabilida/100)
	end

	def contar
		@cantidad_de_galletas = @galletas.size
	end
end

galleta_roja = Galleta.new("rojo", "chocolate", "maiz", 500)
galleta_azul = Galleta.new("rojo", "vainilla", "trigo", 300)
galleta_verde = Galleta.new("rojo", "naranja", "pastelera", 700)

galleta_roja.agregar_decoracion("crema_chantilly")
galleta_azul.agregar_decoracion("bolitas_de_colores")
galleta_verde.agregar_decoracion("mermelada")

# pp galleta_roja.masa
# pp galleta_azul.masa
# pp galleta_verde.color

paquete1 = PaqueteGalletas.new("carton", Time.now, 500, 30)
#pp paquete1
paquete1.agregar_galleta(galleta_roja)
#pp paquete1

paquete2 = PaqueteGalletas.new("carton", Time.now, 500, 20)
12.times do 
	galleta = Galleta.new(Faker::Color.color_name, Faker::Dessert.flavor, Faker::Dessert.variety, Random.new.rand(300..1000))
	paquete2.agregar_galleta(galleta)
	pp paquete2
end
paquete2.definir_costo
puts "El costo del de paquete de galletas es #{paquete2.precio_total}"
pp paquete2