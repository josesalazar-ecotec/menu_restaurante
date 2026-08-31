import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plato.dart';
import 'package:intl/intl.dart';

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({super.key});

  @override
  State<CarritoScreen> createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {

  static const _rojo = Color(0xFFC0392B);

  // Lista de platos agregados al carrito con su cantidad
  final List<Map<String, dynamic>> _carrito = [
    {'plato': platos[0], 'cantidad': 1},
    {'plato': platos[2], 'cantidad': 1},
  ];

  // Calculo el total del pedido
  double get _total => _carrito.fold(0, (suma, item) {
    final plato = item['plato'] as Plato;
    final cantidad = item['cantidad'] as int;
    return suma + (plato.precio * cantidad);
  });

  // Aumento la cantidad de un plato
  void _incrementar(int index) => setState(() => _carrito[index]['cantidad']++);

  // Disminuyo la cantidad — si llega a 0 elimino el plato
  void _decrementar(int index) {
    setState(() {
      if (_carrito[index]['cantidad'] > 1) {
        _carrito[index]['cantidad']--;
      } else {
        _carrito.removeAt(index);
      }
    });
  }

  // Confirmo el pedido con un AlertDialog y vacío el carrito
   // Confirmo el pedido con un AlertDialog y vacío el carrito
  void _confirmarPedido() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('¡Pedido confirmado!',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Text(
          'Tu pedido por \$${_total.toStringAsFixed(2)} será entregado en 20 minutos.\n\nFecha: ${DateFormat('dd/MM/yyyy – hh:mm a').format(DateTime.now())}',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() => _carrito.clear());
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(backgroundColor: _rojo),
            child: Text('Aceptar',
                style: GoogleFonts.poppins(color: Colors.white)),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      appBar: AppBar(
        backgroundColor: _rojo,
        centerTitle: true,
        title: Text('Mi Carrito',
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: _carrito.isEmpty
          // Carrito vacío
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart_outlined,
                      size: 80, color: Colors.grey),
                  const SizedBox(height: 12),
                  Text('Tu carrito está vacío',
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.grey)),
                ],
              ),
            )
          // Lista de platos en el carrito
          : Column(
              children: [

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _carrito.length,
                    itemBuilder: (context, index) {
                      final plato = _carrito[index]['plato'] as Plato;
                      final cantidad = _carrito[index]['cantidad'] as int;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          // Imagen del plato
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(plato.imagen,
                                width: 55, height: 55, fit: BoxFit.cover),
                          ),
                          title: Text(plato.nombre,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 13)),
                          subtitle: Text(
                            '\$${(plato.precio * cantidad).toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(color: _rojo),
                          ),
                          // Controles de cantidad
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline,
                                    color: _rojo, size: 20),
                                onPressed: () => _decrementar(index),
                              ),
                              Text('$cantidad',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline,
                                    color: _rojo, size: 20),
                                onPressed: () => _incrementar(index),
                              ),
                            ],
                          ),
                        ),
                      ); // Card
                    },
                  ), // ListView
                ), // Expanded

                // Panel de total y botón confirmar
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$${_total.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _rojo),
                      ),
                      ElevatedButton(
                        onPressed: _confirmarPedido,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: _rojo,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: Text('Confirmar',
                            style: GoogleFonts.poppins(color: Colors.white)),
                      ),
                    ],
                  ),
                ), // Container total

              ],
            ), // Column

      // FloatingActionButton para limpiar el carrito
        floatingActionButton: FloatingActionButton(
        backgroundColor: _rojo,
        onPressed: () => setState(() => _carrito.clear()),
        child: const Icon(Icons.delete_sweep, color: Colors.white),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

    ); // Scaffold
  }
}