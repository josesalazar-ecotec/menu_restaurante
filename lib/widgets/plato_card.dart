import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/plato.dart';

class PlatoCard extends StatelessWidget {
  final Plato plato;
  final VoidCallback onTap;
  final VoidCallback onFavoritoToggle;

  const PlatoCard({
    super.key,
    required this.plato,
    required this.onTap,
    required this.onFavoritoToggle,
  });

  static const _rojo = Color(0xFFC0392B);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
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
            ),
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
                        Text(
                          '\$${plato.precio.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            color: _rojo,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            plato.esFavorito
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _rojo,
                            size: 20,
                          ),
                          onPressed: onFavoritoToggle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}