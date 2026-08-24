import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MenuApp());
}

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Sabor Ecuatoriano',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC0392B)),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool _mostrarEspecial = false;

  static const _rojo = Color(0xFFC0392B);
  static const _fondo = Color(0xFFFDF6EC);
  static const _card = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fondo,
      appBar: AppBar(
        backgroundColor: _rojo,
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _rojo,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.restaurant, size: 64, color: Colors.white),
                  const SizedBox(height: 8),
                  Text(
                    'Bienvenido',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Comida casera con sazón ecuatoriana',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _seccion('🥗 Entradas'),
            _itemMenu('Ceviche de camarón', 'Fresco, cítrico y picante', '\$4.50', Icons.set_meal),
            _itemMenu('Patacones con queso', 'Crujientes y dorados', '\$3.00', Icons.breakfast_dining),

            const SizedBox(height: 16),
            _seccion('🍖 Platos Fuertes'),
            _itemMenu('Seco de pollo', 'Con arroz, ensalada y maduro', '\$6.50', Icons.lunch_dining),
            _itemMenu('Churrasco', 'Carne a la plancha con papas fritas', '\$8.00', Icons.dinner_dining),
            _itemMenu('Fritada', 'Cerdo frito con mote y maduro', '\$7.00', Icons.restaurant_menu),

            const SizedBox(height: 16),
            _seccion('🥤 Bebidas'),
            _itemMenu('Jugo natural', 'Naranja, mora o maracuyá', '\$1.50', Icons.local_drink),
            _itemMenu('Limonada especial', 'Con hierbabuena y hielo', '\$2.00', Icons.emoji_food_beverage),

            const SizedBox(height: 24),

            // Botón especial
            Center(
              child: ElevatedButton.icon(
                onPressed: () => setState(() => _mostrarEspecial = !_mostrarEspecial),
                icon: Icon(
                  _mostrarEspecial ? Icons.visibility_off : Icons.star,
                  color: Colors.white,
                ),
                label: Text(
                  _mostrarEspecial ? 'Ocultar especial' : 'Ver plato especial del día',
                  style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _rojo,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Panel especial del día
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _mostrarEspecial
                  ? Container(
                      key: const ValueKey('especial'),
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE8E8),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: _rojo, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: _rojo, size: 32),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Plato del día',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold, color: _rojo)),
                                Text('Seco de pollo con arroz, ensalada y jugo',
                                    style: GoogleFonts.poppins(fontSize: 13)),
                                Text('\$5.99 — solo hoy',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600, color: _rojo)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey('vacio')),
            ),

                        const SizedBox(height: 24),

            // Sección horarios
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 6, offset: const Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('📍 Información del restaurante',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 10),
                  Row(children: [
                    const Icon(Icons.access_time, color: Color(0xFFC0392B), size: 18),
                    const SizedBox(width: 8),
                    Text('Lun - Sab: 8:00 AM – 9:00 PM', style: GoogleFonts.poppins(fontSize: 13)),
                  ]),
                  const SizedBox(height: 6),
                  Row(children: [
                    const Icon(Icons.location_on, color: Color(0xFFC0392B), size: 18),
                    const SizedBox(width: 8),
                    Text('Av. Principal 123, Guayaquil', style: GoogleFonts.poppins(fontSize: 13)),
                  ]),
                  const SizedBox(height: 6),
                  Row(children: [
                    const Icon(Icons.phone, color: Color(0xFFC0392B), size: 18),
                    const SizedBox(width: 8),
                    Text('+593 99 123 4567', style: GoogleFonts.poppins(fontSize: 13)),
                  ]),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _seccion(String titulo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        titulo,
        style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _itemMenu(String nombre, String descripcion, String precio, IconData icono) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFE8E8),
          child: Icon(icono, color: _rojo, size: 20),
        ),
        title: Text(nombre, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Text(descripcion, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
        trailing: Text(precio,
            style: GoogleFonts.poppins(color: _rojo, fontWeight: FontWeight.bold, fontSize: 14)),
      ),
    );
  }
}