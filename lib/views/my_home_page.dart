import 'package:flutter/material.dart';
import 'package:learnflutter/views/invoice_veiw.dart';
import 'package:learnflutter/views/notes_view.dart';
import 'package:learnflutter/views/setting_view.dart';
import 'package:learnflutter/views/support_view.dart';
// import 'dart:developer' as devtools show log;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  int _currentIndex = 1;

  final List<Widget> _widgetScreens = const <Widget>[
    InvoiceView(),
    NotesView(),
    SettingsView(),
    SupportView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//             titleSection,
//             boxSection,
//             searchSection,
//             iconSection,
//             sendSection,
//             lineSection,
//             historySection,
//             butttomSection,
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget titleSection = Container(
//   padding: const EdgeInsets.all(20),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       const Text(
//         'Home Page',
//         style: TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       SizedBox(
//         height: 50,
//         width: 50,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(25),
//           child: Image.asset(
//             "assets/avat2.webp",
//             height: 15,
//           ),
//           // Image.network('https://www.tutorialkart.com/img/hummingbird.png'),
//         ),
//       )
//     ],
//   ),
// );

// Widget boxSection = Container(
//   width: double.infinity,
//   padding: const EdgeInsets.all(25),
//   margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(15),
//     gradient: const LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [
//         Colors.greenAccent,
//         Colors.green,
//       ],
//     ),
//   ),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Text(
//         'Welcome to Time-Cash',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const SizedBox(height: 10),
//       const Text(
//         'Manage your Time. Manage your Cash.',
//         style: TextStyle(
//           color: Colors.white,
//         ),
//       ),
//       const SizedBox(height: 10),
//       Text(
//         'No age, currency nor country restriction',
//         style: TextStyle(
//           color: Colors.grey[200],
//           fontSize: 15,
//           fontWeight: FontWeight.w200,
//         ),
//       ),
//       const SizedBox(height: 10),
//       TextButton(
//         onPressed: () {},
//         child: const Text(
//           'Details',
//           style: TextStyle(
//             color: Colors.white,
//             //backgroundColor: Colors.black,
//           ),
//         ),
//       ),
//     ],
//   ),
// );

// Widget searchSection = Container(
//   margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
//   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//   decoration: BoxDecoration(
//     color: Colors.grey[200],
//     borderRadius: BorderRadius.circular(10),
//   ),
//   child: const Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Icon(
//         Icons.search,
//         color: Colors.grey,
//       ),
//       SizedBox(
//         height: 10,
//       ),
//       Expanded(
//         child: Text(
//           'Search',
//           style: TextStyle(color: Colors.grey),
//         ),
//       ),
//       Icon(
//         Icons.mic_none,
//         color: Colors.grey,
//       ),
//     ],
//   ),
// );

// Widget iconSection = Container(
//   padding: const EdgeInsets.all(10),
//   margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Container(
//         padding: const EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           color: Colors.orange,
//           borderRadius: BorderRadius.circular(5),
//         ),
//       )
//     ],
//   ),
// );

// Widget sendSection = Container(
//   padding: const EdgeInsets.all(10),
//   margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       const SizedBox(height: 10),
//       TextButton(
//         onPressed: () {},
//         child: const Text(
//           'SEND',
//           style: TextStyle(
//             color: Colors.green,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       const Icon(
//         Icons.telegram,
//         color: Colors.green,
//       ),
//     ],
//   ),
// );

// Widget lineSection = Container();
// Widget historySection = Container();
// Widget butttomSection = Container();
    );
  }
}
