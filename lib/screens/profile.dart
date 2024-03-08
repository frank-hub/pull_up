import 'package:flutter/material.dart';

import '../Components/color.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
            child: const Icon(Icons.home,
              color: textColor,
            )),
        title: const Text('Event Details',
          style: TextStyle(
            color: textColor,
          ),
        ),
        centerTitle:true,
        actions: [
          Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(Icons.account_circle,
                color: textColor,
              ))
        ],
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage:AssetImage('assets/user-profile.png',
              ),
              radius: 100,
            ),
            const Text("Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            const Text("Frankline Kelvin",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 10,),
            const Text("Bio",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
            ),
            const Text("Some Info about the company or service provider Hello.Some Info about the company or service provider.s",
              style: TextStyle(fontWeight: FontWeight.w300),),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){},

              child: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat,color: textColor,),
                    SizedBox(width: 10,),
                    Text("Messages",style: TextStyle(color: textColor),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: ListTile(
                        title: Text('Events List',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        ),
                        subtitle: Text("30",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 25,
                        ),
                        ),
                      ),
                      height: 190,
                      width: 170,
                    ),
                    Container(
                      child: ListTile(
                        title: Text('Events Tickets',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text("3000",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      height: 190,
                      width: 200,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            const Text("Review",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
              ),
            ),
            Text('This event is for professionals in the field of fitness, holistic health, integrative health, medical, brain health, and wellness.')
          ],
        ),
      ),
    );
  }
}
