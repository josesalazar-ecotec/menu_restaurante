import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plato.dart';

class DetalleScreen extends StatefulWidget {
  // Recibo el plato seleccionado desde la pantalla del menú
  final Plato plato;

  const DetalleScreen({super.key, required this.plato});

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {

  // Controlo qué imagen se muestra actualmente (vista 1 o vista 2)
  bool _mostrandoImagen2 = false;

  // Cantidad de porciones que el usuario quiere pedir
  int _cantidad = 1;

  static const _rojo = Color(0xFFC0392B);

  @override
  Widget build(BuildContext context) {
    final plato = widget.plato;

    // Elijo la imagen según el estado actual
    final imagenActual = _mostrandoImagen2 && plato.imagen2.isNotEmpty
        ? plato.imagen2
        : plato.imagen;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      appBar: AppBar(
        backgroundColor: _rojo,
        centerTitle: true,
        title: Text(
          plato.nombre,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        // Botón para marcar o desmarcar favorito desde el detalle
        actions: [
          IconButton(
            icon: Icon(
              plato.esFavorito ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () => setState(() => plato.esFavorito = !plato.esFavorito),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Imagen principal del plato con gesto para cambiar de vista
            GestureDetector(
              onTap: () {
                // Al tocar la imagen cambio entre vista 1 y vista 2
                if (plato.imagen2.isNotEmpty) {
                  setState(() => _mostrandoImagen2 = !_mostrandoImagen2);
                }
              },
              child: Stack(
                children: [
                  // Imagen del plato con animación Hero
                  Hero(
                    tag: 'plato-${plato.id}',
                    child: Image.asset(
                      imagenActual,
                      width: double.infinity,
                      height: 260,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Indicador de que hay segunda vista disponible
                  if (plato.imagen2.isNotEmpty)
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _mostrandoImagen2 ? 'Vista 2 – toca para cambiar' : 'Vista 1 – toca para cambiar',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ),
                ],
              ),
            ), // GestureDetector imagen

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Nombre y categoría del plato
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          plato.nombre,
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Etiqueta de categoría
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE8E8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          plato.categoria,
                          style: GoogleFonts.poppins(
                              color: _rojo, fontSize: 12),
                        ),
                      ),
                    ],
                  ), // Row nombre y categoría

                  const SizedBox(height: 12),

                  // Descripción completa del plato
                  Text(
                    plato.descripcion,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 12),

                  // Precio y selector de cantidad
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // Precio total según cantidad seleccionada
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Precio unitario',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Colors.grey)),
                          Text(
                            '\$${(plato.precio * _cantidad).toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: _rojo,
                            ),
                          ),
                        ],
                      ),

                      // Contador de porciones con setState
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (_cantidad > 1) {
                                setState(() => _cantidad--);
                              }
                            },
                            icon: const Icon(Icons.remove_circle_outline,
                                color: _rojo),
                          ),
                          Text(
                            '$_cantidad',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () => setState(() => _cantidad++),
                            icon: const Icon(Icons.add_circle_outline,
                                color: _rojo),
                          ),
                        ],
                      ), // Row contador

                    ],
                  ), // Row precio y cantidad

                  const SizedBox(height: 20),

                  // Botón para agregar al carrito con SnackBar de confirmación
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '$_cantidad ${plato.nombre} agregado al carrito',
                              style: GoogleFonts.poppins(),
                            ),
                            backgroundColor: _rojo,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart, color: Colors.white),
                      label: Text(
                        'Agregar al carrito',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _rojo,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ), // ElevatedButton carrito

                ],
              ), // Column padding
            ), // Padding

          ],
        ), // Column body
      ), // SingleChildScrollView
    ); // Scaffold
  }
}