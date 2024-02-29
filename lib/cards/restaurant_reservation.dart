import 'package:flutter/material.dart';

class ReservationCard extends StatelessWidget {
  final String name;
  final String image;
  final int numberOfPeople;
  final String date;
  final String time;

  const ReservationCard({
    super.key,
    required this.name,
    required this.image,
    required this.numberOfPeople,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(8),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // Sin bordes redondeados
        side: BorderSide.none, // Sin bordes
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del restaurante
            SizedBox(
              width: 110,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Borde redondeado para la imagen
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre del restaurante
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Iconos y texto en una sola fila
                  Row(
                    children: [
                      // Icono de personas
                      const Icon(
                        Icons.people,
                        color: Colors.orange,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      // Número de personas
                      Text(
                        '$numberOfPeople',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Icono de calendario
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.orange,
                        size: 14,
                      ),
                      const SizedBox(width: 8),
                      // Fecha
                      Text(
                        '$date',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Icono de tiempo
                      const Icon(
                        Icons.access_time,
                        color: Colors.orange,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      // Hora
                      Text(
                        '$time',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
