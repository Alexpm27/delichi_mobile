import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String date;
  final int stars;
  final String comment;

  const ReviewCard({
    super.key,
    required this.profileImage,
    required this.name,
    required this.date,
    required this.stars,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(date),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                stars,
                    (index) => const Icon(Icons.star, color: Colors.orange, size: 20),
              ),
            ),
            const SizedBox(height: 8),
            Text(comment),
          ],
        ),
      ),
    );
  }
}
