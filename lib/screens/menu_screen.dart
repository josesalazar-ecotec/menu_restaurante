import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plato.dart';
import '../widgets/plato_card.dart';
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

          // Barra de filtros horizontal – el usuario toca una categoría
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

          // Lista principal de platos usando el widget reutilizable PlatoCard
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _platosFiltrados.length,
              itemBuilder: (context, index) {
                final plato = _platosFiltrados[index];

                return PlatoCard(
                  plato: plato,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetalleScreen(plato: plato),
                    ),
                  ),
                  onFavoritoToggle: () => setState(
                    () => plato.esFavorito = !plato.esFavorito,
                  ),
                );
              },
            ), // ListView.builder
          ), // Expanded

        ],
      ), // Column body
    ); // Scaffold
  }
}