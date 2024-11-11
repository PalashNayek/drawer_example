import 'package:drawer_example/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import '../di/setup_locator.dart';
import '../view_models/drawer_view_model.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatelessWidget {
  final DrawerViewModel viewModel = getIt<DrawerViewModel>();

  final List<Widget> _screens = [
    HomeScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Example"),
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, _) {
          return _screens[viewModel.selectedScreenIndex];
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                viewModel.setSelectedScreenIndex(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                viewModel.setSelectedScreenIndex(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                viewModel.setSelectedScreenIndex(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
