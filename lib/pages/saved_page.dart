import 'package:delichi/cards/restaurant_search.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2, // Reemplaza con el número real de restaurantes
                itemBuilder: (context, index) {
                  return const RestaurantCard(
                    name: 'Las Brisas',
                    image: 'https://i0.wp.com/foodandpleasure.com/wp-content/uploads/2020/09/piantao.jpg?resize=768%2C768&ssl=1',
                    // URL de la imagen del restaurante
                    rating: 4.5,
                    // Calificación del restaurante
                    reviews: 100,
                    // Número de reseñas del restaurante
                    location: 'Coita/San Antonio',
                    cuisine: 'Tacos',
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
