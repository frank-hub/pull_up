import 'package:flutter/material.dart';

import '../../Components/color.dart';
import '../home.dart';
import '../profile.dart';
class BuyRsvp extends StatelessWidget {
  const BuyRsvp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,

        leading: GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Home())
              );
            },
            child: Icon(Icons.home,
              color: textColor,
            )),
        title: const Text('Event Details',
          style: TextStyle(
            color: textColor,
          ),
        ),
        centerTitle:true,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Profile())
              );
            },
            child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.account_circle,
                  color: textColor,
                )),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(
                child: Text("BUY TICKET 1,000 Ksh.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(
                child: Text("RSVP TICKET 1,000 Ksh.",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
