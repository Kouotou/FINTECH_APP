import 'package:flutter/material.dart';
import 'package:learnflutter/views/invoice_veiw.dart';
import 'package:learnflutter/views/notes_view.dart';
import 'package:learnflutter/views/setting_view.dart';
import 'package:learnflutter/views/support_view.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _widgetScreens = const <Widget>[
    InvoiceView(),
    NotesView(),
    SettingsView(),
    SupportView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SizedBox.expand(
      //   child: PageView(
      //     controller: _pageController,
      //     onPageChanged: (currentIndex),{
      //       setState((){
      //       _currentIndex = currentIndex;
      //       })
      //     }
      //   ),
      // )
      body: _widgetScreens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        //to permit navigation
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(
            () {
              _currentIndex = value;
            },
          );
        },

        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Invoice',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
