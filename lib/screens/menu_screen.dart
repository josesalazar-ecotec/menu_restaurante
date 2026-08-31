import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plato.dart';
import 'detalle_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  // Empiezo mostrando todas las categorías por defecto
  String _categoriaSeleccionada = 'Todas';
  final List<String> _categorias = ['Todas', 'Entradas', 'Platos Fuertes', 'Bebidas'];

  // Devuelvo solo los platos que corresponden a la categoría activa
  List<Plato> get _platosFiltrados {
    if (_categoriaSeleccionada == 'Todas') return platos;
    return platos.where((p) => p.categoria == _categoriaSeleccionada).toList();
  }

  static const _rojo = Color(0xFFC0392B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      appBar: AppBar(
        backgroundColor: _rojo,
        centerTitle: true,
        title: Text(
          'Nuestro Menú',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Flecha para regresar a la pantalla anterior
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [

          // Barra de filtros horizontal — el usuario toca una categoría
          // y la lista se actualiza automáticamente con setState
          Container(
            height: 50,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: _categorias.length,
              itemBuilder: (context, index) {
                final cat = _categorias[index];
                final seleccionada = cat == _categoriaSeleccionada;

                return GestureDetector(
                  // Al tocar una categoría actualizo el estado
                  onTap: () => setState(() => _categoriaSeleccionada = cat),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      // La categoría activa se pinta de rojo, las demás en gris
                      color: seleccionada ? _rojo : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        cat,
                        style: GoogleFonts.poppins(
                          color: seleccionada ? Colors.white : Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ); // GestureDetector
              },
            ),
          ), // Container filtros

          // Lista principal de platos — uso ListView.builder para
          // no renderizar todos los elementos de una vez
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _platosFiltrados.length,
              itemBuilder: (context, index) {
                final plato = _platosFiltrados[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    // Al tocar la tarjeta navego al detalle del plato
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetalleScreen(plato: plato),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    child: Row(
                      children: [

                        // Imagen del plato con esquinas redondeadas a la izquierda
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.asset(
                            plato.imagen,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ), // ClipRRect imagen

                        // Información del plato: nombre, descripción, precio y favorito
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  plato.nombre,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                // Limito la descripción a 2 líneas para no romper el diseño
                                Text(
                                  plato.descripcion,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Colors.grey[600],
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    // Precio formateado con 2 decimales
                                    Text(
                                      '\$${plato.precio.toStringAsFixed(2)}',
                                      style: GoogleFonts.poppins(
                                        color: _rojo,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),

                                    // Corazón que cambia entre lleno y vacío con setState
                                    IconButton(
                                      icon: Icon(
                                        plato.esFavorito
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: _rojo,
                                        size: 20,
                                      ),
                                      onPressed: () => setState(
                                        () => plato.esFavorito = !plato.esFavorito,
                                      ),
                                    ),

                                  ],
                                ), // Row precio y favorito

                              ],
                            ), // Column info
                          ), // Padding
                        ), // Expanded info

                      ],
                    ), // Row card
                  ), // InkWell
                ); // Card
              },
            ), // ListView.builder
          ), // Expanded

        ],
      ), // Column body
    ); // Scaffold
  }
}