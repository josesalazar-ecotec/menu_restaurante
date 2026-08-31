// Modelo que representa un plato del menú
class Plato {
  final String id;
  final String nombre;
  final String descripcion;
  final double precio;
  final String categoria;
  final String imagen; // ruta del asset de imagen
  final String imagen2; // segunda vista del plato
  bool esFavorito; // estado que cambia con setState

  Plato({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.categoria,
    required this.imagen,
    this.imagen2 = '',
    this.esFavorito = false,
  });
}

// Lista global de platos del restaurante
final List<Plato> platos = [
  // Entradas
  Plato(
    id: '1',
    nombre: 'Ceviche de camarón',
    descripcion: 'Fresco, cítrico y picante. Preparado con camarones frescos, limón, cebolla morada y cilantro.',
    precio: 4.50,
    categoria: 'Entradas',
    imagen: 'assets/images/ceviche_1.png',
    imagen2: 'assets/images/ceviche_2.png',
  ),
  Plato(
    id: '2',
    nombre: 'Patacones con queso',
    descripcion: 'Crujientes y dorados. Plátano verde frito aplastado con queso derretido.',
    precio: 3.00,
    categoria: 'Entradas',
    imagen: 'assets/images/patacones_1.png',
    imagen2: 'assets/images/patacones_2.png',
  ),
  // Platos fuertes
  Plato(
    id: '3',
    nombre: 'Seco de pollo',
    descripcion: 'Con arroz, ensalada y maduro. Pollo cocinado en salsa de cerveza y especias.',
    precio: 6.50,
    categoria: 'Platos Fuertes',
    imagen: 'assets/images/seco_pollo_1.png',
    imagen2: 'assets/images/seco_pollo_2.png',
  ),
  Plato(
    id: '4',
    nombre: 'Churrasco',
    descripcion: 'Carne a la plancha con papas fritas, arroz y ensalada fresca.',
    precio: 8.00,
    categoria: 'Platos Fuertes',
    imagen: 'assets/images/logo.png',
    imagen2: 'assets/images/logo.png',
  ),
  Plato(
    id: '5',
    nombre: 'Fritada',
    descripcion: 'Cerdo frito con mote, maduro y encurtido de cebolla.',
    precio: 7.00,
    categoria: 'Platos Fuertes',
    imagen: 'assets/images/logo.png',
    imagen2: 'assets/images/logo.png',
  ),
  // Bebidas
  Plato(
    id: '6',
    nombre: 'Jugo natural',
    descripcion: 'Naranja, mora o maracuyá. Recién exprimido.',
    precio: 1.50,
    categoria: 'Bebidas',
    imagen: 'assets/images/logo.png',
  ),
  Plato(
    id: '7',
    nombre: 'Limonada especial',
    descripcion: 'Con hierbabuena y hielo. Refrescante y natural.',
    precio: 2.00,
    categoria: 'Bebidas',
    imagen: 'assets/images/logo.png',
  ),
];