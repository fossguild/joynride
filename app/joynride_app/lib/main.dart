import 'package:flutter/material.dart';
import 'package:joynride_app/screens/home_screen.dart';
import 'package:joynride_app/screens/login_screen.dart';
import 'package:joynride_app/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _logged = false;

  void login() {
    setState(() {
      _logged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme.copyWith(
          primary: primaryBlue,
          secondary: secondaryBlue,
          tertiary: yellow,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onTertiary: Colors.white,
        );

    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: grayBlue,
          bodyColor: grayBlue,
        );

    return MaterialApp(
      home: _logged ? const HomeScreen() : LoginScreen(login),
      theme: ThemeData.from(
        colorScheme: colorScheme,
        textTheme: textTheme,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}
