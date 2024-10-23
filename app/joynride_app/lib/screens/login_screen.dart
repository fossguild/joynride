import 'package:flutter/material.dart';
import 'package:joynride_app/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // _LoginScreenState createState() => _LoginScreenState();
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showFields = false;
  double _logoHeight = 250;

  void _toggleFields() {
    setState(() {
      _showFields = !_showFields;
      _logoHeight = _showFields ? 150 : 250;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/logo/joynride_3.png',
                height: _logoHeight,
              ),
              const SizedBox(height: 20),
              const Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              if (_showFields)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _showFields ? 1.0 : 0.0,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: 'Senha',
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: yellow,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: _toggleFields,
                child: Text(
                  _showFields ? 'Entrar' : 'Iniciar Sessão',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
