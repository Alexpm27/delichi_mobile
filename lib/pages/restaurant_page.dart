import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../cards/review.dart';
import '../cards/restaurant_image.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key});

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  late Map<String, dynamic> restaurantData;

  @override
  void initState() {
    super.initState();
    fetchRestaurantData().then((data) {
      setState(() {
        restaurantData = data;
      });
    }).catchError((error) {
      print('Error fetching restaurant data: $error');
    });
  }

  Future<Map<String, dynamic>> fetchRestaurantData() async {
    final response = await http.get(Uri.parse('URL_DE_TU_API_AQUÍ'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load restaurant data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: restaurantData != null
            ? SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carrusel de imágenes
              SizedBox(
                width: MediaQuery.of(context).size.width, // Ancho de la pantalla
                height: 270,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var imageUrl in restaurantData['images'])
                      RestaurantImageCard(imageUrl: imageUrl),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  restaurantData['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
              // Nombre, estrellas y número de reseñas
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const SizedBox(width: 5),
                  Text(
                      '${restaurantData['rating']} (${restaurantData['reviews']} reseñas)'),
                ],
              ),
              const SizedBox(height: 10),
              // Tipo de cocina
              Row(
                children: [
                  const Icon(Icons.food_bank, color: Colors.orange, size: 20),
                  const SizedBox(width: 5),
                  Text(restaurantData['cuisine']),
                ],
              ),
              const SizedBox(height: 10),
              // Ubicación
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.orange, size: 20),
                  const SizedBox(width: 5),
                  Text(restaurantData['address']),
                ],
              ),
              const SizedBox(height: 20),
              // Botón para reservar
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón de reservar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text(
                    'Reservar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Acordeón para horarios
              const ExpansionTile(
                title: Text('Horarios'),
                children: [
                  // Aquí van los horarios del restaurante en forma de lista o tabla
                ],
              ),
              const SizedBox(height: 20),
              // Acordeón para menú
              const ExpansionTile(
                title: Text('Menú'),
                children: [
                  // Aquí va el menú del restaurante en forma de lista o tabla
                ],
              ),
              const SizedBox(height: 20),
              // Sección de reseñas
              const SizedBox(height: 20),
              const Text(
                'Reseñas',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              for (var review in restaurantData['reviews'])
                ReviewCard(
                  profileImage: review['profileImage'],
                  name: review['name'],
                  date: review['date'],
                  stars: review['stars'],
                  comment: review['comment'],
                ),
            ],
          ),
        )
            : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
