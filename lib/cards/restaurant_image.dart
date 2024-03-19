import 'package:flutter/material.dart';

class RestaurantImageCard extends StatelessWidget {
  final String imageUrl;

  const RestaurantImageCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ClipRRect(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
