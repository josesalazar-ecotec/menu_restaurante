import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NosotrosScreen extends StatelessWidget {
  const NosotrosScreen({super.key});

  static const _rojo = Color(0xFFC0392B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      appBar: AppBar(
        backgroundColor: _rojo,
        centerTitle: true,
        title: Text(
          'Nosotros',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Botón para regresar a la pantalla anterior
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 10),

            // Logo del restaurante cargado desde assets
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/logo.png',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // Nombre del restaurante
            Text(
              'El Sabor Ecuatoriano',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _rojo,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Descripción del restaurante
            Text(
              'Somos un restaurante familiar con más de 15 años ofreciendo '
              'lo mejor de la cocina ecuatoriana. Cada plato está preparado '
              'con ingredientes frescos y la sazón que nos caracteriza.',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // Sección de información de contacto
            Text(
              '📍 Información de contacto',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Tarjetas de información usando Card y ListTile
            _infoCard(
              icono: Icons.location_on,
              titulo: 'Dirección',
              subtitulo: 'Av. Principal 123, Guayaquil, Ecuador',
            ),

            _infoCard(
              icono: Icons.phone,
              titulo: 'Teléfono',
              subtitulo: '+593 99 123 4567',
            ),

            _infoCard(
              icono: Icons.access_time,
              titulo: 'Horario',
              subtitulo: 'Lunes a Sábado: 8:00 AM – 9:00 PM',
            ),

            _infoCard(
              icono: Icons.email,
              titulo: 'Correo',
              subtitulo: 'info@elsaborecuatoriano.com',
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // Sección de valores del restaurante
            Text(
              '⭐ Nuestros valores',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Fila de valores usando Row y Expanded
            Row(
              children: [
                Expanded(child: _valorCard('🥘', 'Sabor\nAuténtico')),
                const SizedBox(width: 12),
                Expanded(child: _valorCard('🌿', 'Ingredientes\nFrescos')),
                const SizedBox(width: 12),
                Expanded(child: _valorCard('❤️', 'Atención\nFamiliar')),
              ],
            ), // Row valores

            const SizedBox(height: 30),

          ],
        ), // Column
      ), // SingleChildScrollView
    ); // Scaffold
  }

  // Widget reutilizable para cada dato de contacto
  Widget _infoCard({
    required IconData icono,
    required String titulo,
    required String subtitulo,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFE8E8),
          child: Icon(icono, color: _rojo, size: 20),
        ),
        title: Text(titulo,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 13)),
        subtitle: Text(subtitulo,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
      ),
    ); // Card
  }

  // Widget reutilizable para cada valor del restaurante
  Widget _valorCard(String emoji, String texto) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 8),
          Text(
            texto,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ), // Column
    ); // Container
  }
}