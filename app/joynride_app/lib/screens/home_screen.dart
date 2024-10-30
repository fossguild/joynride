import 'package:flutter/material.dart';
import 'package:joynride_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image:
                AssetImage('assets/images/backgrounds/background_1_blue.png'),
          ),
        ),
        child: [const SearchScreen(), for(var i = 0; i < 4; i++) Placeholder()][_currentPageIndex],
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: NavigationBar(
          indicatorColor: colorScheme.tertiary,
          backgroundColor: Colors.white,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          selectedIndex: _currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.place),
              label: 'Procurar',
            ),
            NavigationDestination(
              icon: Icon(Icons.commute),
              label: 'Oferecer',
            ),
            NavigationDestination(
              icon: Icon(Icons.local_taxi),
              label: 'Caronas',
            ),
            NavigationDestination(
              icon: Icon(Icons.inbox),
              label: 'Mensagens',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
