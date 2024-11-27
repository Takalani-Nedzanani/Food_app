import 'package:flutter/material.dart';
import 'package:food_app/widgets/themeManager.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 239, 148, 11),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Theme Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.light_mode, color: Colors.yellow),
              title: const Text('Light Theme'),
              onTap: () {
                themeManager.setTheme(ThemeData.light());
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode, color: Colors.black),
              title: const Text('Dark Theme'),
              onTap: () {
                themeManager.setTheme(ThemeData.dark());
              },
            ),
            ListTile(
              leading: const Icon(Icons.color_lens, color: Colors.blue),
              title: const Text('Custom Blue Theme'),
              onTap: () {
                themeManager.setTheme(
                  ThemeData(
                    primarySwatch: Colors.blue,
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
