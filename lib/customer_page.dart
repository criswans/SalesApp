import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/bottom_bar.dart';

class CustomerPage extends StatefulWidget {


  const CustomerPage({super.key});

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {

  User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Customer Page'),
        ),
        body: Text(user.toString()),
        bottomNavigationBar: BottomBar(index: 1,)
    );
  }
}


