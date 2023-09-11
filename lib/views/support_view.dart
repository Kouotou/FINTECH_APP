import 'package:flutter/material.dart';
import 'package:learnflutter/constants/routes.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
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
