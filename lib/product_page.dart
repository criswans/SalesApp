import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/bottom_bar.dart';

class ProductPage extends StatefulWidget {


  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Page'),
        ),
        body: Text(user.toString()),
        bottomNavigationBar: BottomBar(index: 2,)
    );
  }
}


