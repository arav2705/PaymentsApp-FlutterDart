import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amberAccent, Colors.red], // Adjust colors as needed
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Payment Expenses App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'The Payment Expenses tracking app is a valuable tool for users seeking efficient and organized management of their financial transactions. By providing a user-friendly interface for tracking various payment expenses, the app empowers individuals to gain insights into their spending habits and make informed financial decisions. Users can effortlessly add, edit, and delete expenses in different categories, allowing for a detailed overview of their financial landscape.',
                style: TextStyle(fontSize: 20),
              ),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 250,
                  child: Image.asset('images/image2.png'),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context); // Navigate back to the previous page (likely the home page)
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
