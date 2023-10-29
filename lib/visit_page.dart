import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/bottom_bar.dart';
import 'package:sales_app/home.dart';

import 'firebase_auth.dart';
import 'login.dart';


class VisitPage extends StatefulWidget {


  const VisitPage({super.key});

  @override
  _VisitPageState createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {

  User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visit Page'),
      ),
      body: Text(user.toString()),
      bottomNavigationBar: BottomBar(index: 0,)
    );
  }
}


