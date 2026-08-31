import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu_screen.dart';
import 'nosotros_screen.dart';
import 'carrito_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC0392B),
        centerTitle: true,
        title: Text(
          '🍽️ El Sabor Ecuatoriano',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Logo
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFC0392B),
                borderRadius: BorderRadius.circular(60),
              ),
              child: const Icon(Icons.restaurant, size: 64, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              'El Sabor Ecuatoriano',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFC0392B),
              ),
            ),
            Text(
              'Comida casera con sazón ecuatoriana',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Botones de navegación
            _botonNavegacion(
              context,
              icono: Icons.restaurant_menu,
              titulo: 'Ver Menú',
              subtitulo: 'Entradas, platos fuertes y bebidas',
              destino: const MenuScreen(),
            ),
            const SizedBox(height: 16),
            _botonNavegacion(
              context,
              icono: Icons.shopping_cart,
              titulo: 'Mi Carrito',
              subtitulo: 'Revisa tus pedidos',
              destino: const CarritoScreen(),
            ),
            const SizedBox(height: 16),
            _botonNavegacion(
              context,
              icono: Icons.info_outline,
              titulo: 'Nosotros',
              subtitulo: 'Conoce nuestro restaurante',
              destino: const NosotrosScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _botonNavegacion(
    BuildContext context, {
    required IconData icono,
    required String titulo,
    required String subtitulo,
    required Widget destino,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFE8E8),
          child: Icon(icono, color: const Color(0xFFC0392B)),
        ),
        title: Text(titulo,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitulo,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 16, color: Color(0xFFC0392B)),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destino),
        ),
      ),
    );
  }
}