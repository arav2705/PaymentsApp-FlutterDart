import 'package:cash_app/main.dart';
import 'cash_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.red.shade200,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      child: const Text('Go to Home Page'),
    );
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _icon(),
        const SizedBox(height: 50),
        inputField("Username", usernameController),
        const SizedBox(height: 50),
        inputField("Password", passwordController, isPassword: true),
        const SizedBox(height: 50),
        _loginBtn(),
        const SizedBox(height: 20),
        _extraText(),
        const SizedBox(height: 30),
        _CashBtn()
      ])),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Username: ${usernameController.text}");
        debugPrint("Password: ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 74, 4, 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
    );
  }

  Widget _extraText() {
    return const Text("Can't access your account?",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.white));
  }

  // ignore: non_constant_identifier_names
  Widget _CashBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CashPage()),
        );
      },
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "View Payments",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
