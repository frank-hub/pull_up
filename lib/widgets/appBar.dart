import 'package:flutter/material.dart';

import '../Components/color.dart';
import '../screens/home.dart';

class PullAppBar extends StatelessWidget {
  const PullAppBar({super.key, required Color backgroundColor, required GestureDetector leading, required Text title, required bool centerTitle, required List<Container> actions});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
    backgroundColor: primaryColor,

    leading: GestureDetector(
    onTap: (){
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context)=>Home())
    );
    },
    child: Icon(Icons.home,
    color: textColor,
    )),
    title: const Text('Event Booking',
    style: TextStyle(
    color: textColor,
    ),
    ),
    centerTitle:true,
    actions: [
    Container(
    padding: const EdgeInsets.only(right: 10),
    child: Icon(Icons.account_circle,
    color: textColor,
    ))
    ],
    );
  }
}
