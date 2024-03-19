import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String image;
  final double rating;
  final int reviews;
  final String location;
  final String cuisine;

  const RestaurantCard({
    Key? key,
    required this.name,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.location,
    required this.cuisine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0, // No sombra
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: BorderSide.none
      ),
      child: Container(
        decoration: const BoxDecoration(
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen a la derecha
            SizedBox(
              width: 120,
              height: 105,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Borde redondeado para la imagen
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Contenido del restaurante a la izquierda
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 15,),
                        const Icon(Icons.star, color: Colors.orange, size: 15,),
                        const Icon(Icons.star, color: Colors.orange, size: 15,),
                        const Icon(Icons.star, color: Colors.orange, size: 15,),
                        const Icon(Icons.star, color: Colors.orange, size: 15,),

                        Text(
                          ' ($reviews reseñas)',
                          style: const TextStyle(
                            fontSize: 10,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.grey, size: 13,),
                        const SizedBox(width: 3,),
                        Text(location,
                          style: const TextStyle(
                              fontSize: 10
                          ),),
                      ],
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      children: [
                        const Icon(Icons.food_bank_outlined, color: Colors.grey, size: 13,),
                        const SizedBox(width: 3,),
                        Text(cuisine, style: const TextStyle(
                            fontSize: 10
                        )),
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
