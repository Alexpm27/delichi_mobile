import 'package:delichi/cards/restaurant_search.dart';
import 'package:delichi/cards/restaurant_reservation.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservaciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Reemplaza con el número real de restaurantes
                itemBuilder: (context, index) {
                  return const ReservationCard(
                    name: 'Las Brisas',
                    image: 'https://i0.wp.com/foodandpleasure.com/wp-content/uploads/2020/09/restaurantes-naturaleza-nueve-nueve-1.jpg?w=1024&ssl=1',
                    // URL de la imagen del restaurante
                    numberOfPeople: 2,
                    date: '2/02/24',
                    time: '16:20',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
