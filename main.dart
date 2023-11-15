import 'package:flutter/material.dart';
import 'login_page.dart';
import 'about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'to our Payments Tracker',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 150,
              height: 250,
              child: Image.asset('images/image1.png'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const LoginPage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red,
                    minimumSize: const Size(300, 40)),
                child: const Text('Login')),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(300, 40)),
                child: const Text('ABOUT US')),
          ],
        ),
      ),
    );
  }
}
