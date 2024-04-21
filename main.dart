import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const LoginApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LoginPage({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: non_constant_identifier_names
  final YourName = 'Indra-Sandro';
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoggedIn = false;

  void _cekLogin() {
    String email = usernameController.text;
    String password = passwordController.text;

    if (email == "admin" && password == "admin123") {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Gagal'),
            content: const Text('Username atau password salah.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      // ignore: prefer_const_constructors
      return HomePage();
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Halaman Login')),
        resizeToAvoidBottomInset: false, // Tambahkan properti ini
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  // ignore: unnecessary_brace_in_string_interps
                  'Welcome to ${YourName}',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 20.0),
                Image.asset(
                  'assets/images/mobil.png',
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 20.0),
                TextField(
                  controller: usernameController,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(labelText: 'Email/Mobile Number'),
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 20.0),
                TextField(
                  controller: passwordController,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => _cekLogin(),
                  // ignore: prefer_const_constructors
                  child: Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle forgot password logic
                  },
                  // ignore: sort_child_properties_last, prefer_const_constructors
                  child: Text('Forgot your password?'),
                  style: TextButton.styleFrom(),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
