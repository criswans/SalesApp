import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sales_app/bottom_bar.dart';
import 'package:sales_app/loading.dart';
import 'firebase_auth.dart';
import 'login.dart';


class ProfilePage extends StatefulWidget {


  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  late User _currentUser;

  Future<void> onRefresh() async {

      User user = (await FireAuth.refreshUser(_currentUser))!;
      setState(() {
        logger.i(user);
        _currentUser = user;
      });


    _refreshController.refreshCompleted();
  }
  void onLoading(){
    _refreshController.loadComplete();
  }
  @override
  void initState() {
    _currentUser = FirebaseAuth.instance.currentUser!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const Text('Profile'),
          Container(
            alignment: Alignment.center,
            width: 35,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20)
            ),
            child: IconButton(
            icon: const Icon(Icons.logout,),
            iconSize: 25,
            color: Colors.white,
            onPressed: () async {
              circularLoading(context);
              await FirebaseAuth.instance.signOut().then((value){
                Navigator.of(context).pushNamed('/loginPage');
              });
            },
          ),)

        ],),
        backgroundColor: Colors.amber,
      ),
      body:
      SmartRefresher(
        controller: _refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child:
      Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 10),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.shade200,
              //         spreadRadius: 3,
              //         blurRadius: 2,
              //
              //       )
              //     ]
              // ),
              child:
            ListTile(
              leading: Icon(Icons.person),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_currentUser.displayName.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  ),
                  Text("role"),
                  Divider(
                    thickness: 2,
                  )
                ],
              ),
              subtitle: Column(
                children: [
                  Row(children: [
                    Icon(Icons.email, color: Colors.amber,),
                    SizedBox(width: 3,),
                    Text(_currentUser.email.toString()),
                    _currentUser.emailVerified
                        ?
                        Icon(Icons.verified, color: Colors.green,)
                        :
                          Icon(Icons.cancel, color: Colors.red,),

                  ],),

                  _currentUser.emailVerified ?
                      SizedBox()
                      :ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)
                    ),
                    onPressed: () async {
                      circularLoading(context);

                      await _currentUser.sendEmailVerification().then((value) =>
                      Navigator.pop(context)
                      );
                    },
                    child: Text('Verify email', style: TextStyle(
                      fontSize: 15
                    ),
                    
                    ),
                    
                  ),

                  SizedBox(height: 10,),
                  Row(children: [
                    Icon(Icons.phone, color: Colors.amber,),
                    SizedBox(width: 3,),
                    Text(_currentUser.phoneNumber.toString()),
                  ],)
                ],
              ),
            ),),
          ],
        ),),

      bottomNavigationBar: BottomBar(index: 3,),
    );
  }
}


