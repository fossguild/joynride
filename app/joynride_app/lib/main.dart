import 'package:flutter/material.dart';
import 'package:joynride_app/screens/login_screen.dart';
import 'package:joynride_app/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme.copyWith(
          primary: primaryBlue,
          secondary: secondaryBlue,
          tertiary: yellow,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onTertiary: Colors.black,
        );
    return MaterialApp(
      home: const LoginScreen(),
      theme: ThemeData.from(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}
