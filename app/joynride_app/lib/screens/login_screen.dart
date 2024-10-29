import 'package:flutter/material.dart';
import 'package:joynride_app/widgets/simple_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(this.login, {super.key});

  final void Function() login;

  @override
  // _LoginScreenState createState() => _LoginScreenState();
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showFields = false;
  final double _logoHeight = 250;
  final double _curvedTextWidth = 250;

  void login() {
    widget.login();
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('Login is not yet implemented')),
    // );
  }

  void _toggleFields() {
    setState(() {
      _showFields = !_showFields;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorSchema = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorSchema.primary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          alignment: Alignment.topCenter,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const SizedBox(
                height: 340,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  margin: EdgeInsets.all(0),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Image.asset(
                      'assets/images/logo/joynride_curved_text.png',
                      width: _curvedTextWidth,
                    ),
                    Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(0),
                      shape: const CircleBorder(),
                      elevation: 0,
                      child: Image.asset(
                        'assets/images/logo/joynride_3.png',
                        height: _logoHeight,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (!_showFields)
                      const Column(
                        children: [
                          Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Faça login pelo sistema unificado JupiterWeb',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 20),
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
                                  icon: Icon(Icons.email),
                                  // prefixIcon: Icon(Icons.email),
                                  hintText: 'Email Institucional',
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
                                  icon: Icon(Icons.lock),
                                  // prefixIcon: Icon(Icons.lock),
                                  hintText: 'Senha',
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    SimpleButton(
                      text: 'Entrar',
                      onPressed: login,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
