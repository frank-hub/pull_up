import 'package:flutter/material.dart';
import 'package:pull_up/screens/profile.dart';

class topbar extends StatelessWidget {
  const topbar({super.key});
  @override
  Widget build(BuildContext context) {
    var title = 'Pull Up';

    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xFFD43642)
      ),
      child: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.only(left:10,right: 10,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.home,
                  color: Colors.white,
                  size: 25,
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white38
                  ),
                  child: Text(title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context,
                         MaterialPageRoute(builder: (context)=>Profile())
                    );
                  },
                  child: const Icon(Icons.account_circle,
                    color: Colors.white,
                    size: 25,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
