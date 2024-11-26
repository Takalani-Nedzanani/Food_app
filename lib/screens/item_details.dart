import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Taco de Carnitas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Juicy shredded pork, wrapped in a warm tortilla, with cheese and lemon.'),
            const SizedBox(height: 16),
            const Text('R75', style: TextStyle(fontSize: 24, color: Colors.green)),
            const SizedBox(height: 16),
            const Text('Recommended Sides'),
            const SizedBox(height: 8),
            const Text('- Wings & Fries: R45'),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                const Text('1', style: TextStyle(fontSize: 16)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Add to Cart')),
          ],
        ),
      ),
    );
  }
}
