import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_auth.dart';
import 'login.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/login': (context) => LoginPage(),
        // "/bar": (BuildContext context) => DefaultAppBarDemo(),
        // "/custom": (BuildContext context) => CustomAppBarDemo(),
        // "/fab": (BuildContext context) => ConvexButtonDemo(),
      },
    );
  }
}

// class HomeAppBar extends StatelessWidget {
//   const HomeAppBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Hello ConvexAppBar')),
//       body: Center(
//           child: TextButton(
//             child: Text('Click to show full example'),
//             onPressed: () => Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => HomeAppBar(),
//               ),
//             ),
//           )),
//       bottomNavigationBar: ConvexAppBar(
//         style: TabStyle.react,
//         items: const [
//           TabItem(icon: Icons.list),
//           TabItem(icon: Icons.calendar_today),
//           TabItem(icon: Icons.assessment),
//         ],
//         initialActiveIndex: 1,
//         onTap: (int i) => print('click index=$i'),
//       ),
//     );
//   }
// }