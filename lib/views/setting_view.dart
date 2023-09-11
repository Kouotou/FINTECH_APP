import 'package:flutter/material.dart';
import 'package:learnflutter/constants/routes.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        //to permit navigation
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(
            () {
              _currentIndex = value;
              if (_currentIndex == 0) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  homePageRoute,
                  (route) => false,
                );
              } else if (_currentIndex == 1) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  invoiceRoute,
                  (route) => false,
                );
              } else if (_currentIndex == 2) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  settingsRoute,
                  (route) => false,
                );
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  supportRoute,
                  (route) => false,
                );
              }
            },
          );
        },

        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Invoice',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assistant),
            label: 'Support',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
