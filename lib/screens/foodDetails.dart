import 'package:flutter/material.dart';

class FoodDetailsPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;
  final Function(String, String, String) onAddToCart;

  const FoodDetailsPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 239, 148, 11),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(imagePath, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              price,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                onAddToCart(title, price, imagePath);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 239, 148, 11),
              ),
              child: const Text('Add to Cart'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Recommended Dishes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Horizontal Scroll View for Recommended Dishes
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildRecommendedDish(
                    context,
                    title: 'Taco de Carnitas',
                    price: 'R75',
                    imagePath: 'assets/images/taco1.jpg',
                  ),
                  _buildRecommendedDish(
                    context,
                    title: 'Spring Rolls',
                    price: 'R25',
                    imagePath: 'assets/images/side2.jpeg',
                  ),
                  _buildRecommendedDish(
                    context,
                    title: 'Chicken Nuggets',
                    price: 'R30',
                    imagePath: 'assets/images/snack1.jpeg',
                  ),
                  _buildRecommendedDish(
                    context,
                    title: 'Beef Burger',
                    price: 'R50',
                    imagePath: 'assets/images/burger.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Widget for Recommended Dishes
  Widget _buildRecommendedDish(
    BuildContext context, {
    required String title,
    required String price,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigate to the details page for the recommended dish
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsPage(
              title: title,
              subtitle: 'Delicious $title', // Generic subtitle for simplicity
              price: price,
              imagePath: imagePath,
              onAddToCart: onAddToCart,
            ),
          ),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath,
                width: 140,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
