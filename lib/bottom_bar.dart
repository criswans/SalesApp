import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int index;
  BottomBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Colors.amber,
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.calendar_today),
          TabItem(icon: Icons.store),
          TabItem(icon: Icons.indeterminate_check_box),
          TabItem(icon: Icons.settings)
        ],
        initialActiveIndex: index,
        onTap: (int i){

        if(i == 0){
          Navigator.pushReplacementNamed(context, '/visitPage');
          // Navigator.of(context).pushNamed('/visitPage');
        }
        if(i == 1){
          Navigator.pushReplacementNamed(context, '/customerPage');
        }
        if(i == 2){
          Navigator.pushReplacementNamed(context, '/productPage');
        }
        if(i == 3){
          Navigator.pushReplacementNamed(context, '/profilePage');
        }
        },
      );

  }
}