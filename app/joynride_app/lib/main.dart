import 'package:flutter/material.dart';
import 'package:joynride_app/screens/home_screen.dart';
import 'package:joynride_app/screens/login_screen.dart';
import 'package:joynride_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class WidgetTest extends StatelessWidget {
  const WidgetTest(this.widget, {super.key});

  final Widget widget;
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
          fontFamily: GoogleFonts.roboto().fontFamily,
          displayColor: grayBlue,
          bodyColor: grayBlue,
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        alignment: Alignment.center,
        // margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: widget,
        ),
      ),
      theme: ThemeData.from(
        colorScheme: colorScheme,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
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
          fontFamily: GoogleFonts.roboto().fontFamily,
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
