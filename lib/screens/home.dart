import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cover.jpg'),
                  fit: BoxFit.fill
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.only(left:10,right: 10,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.account_circle,
                          ),
                          radius: 18,
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white38
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.pin_drop,
                              color: Colors.white,),
                              Text("Nairobi",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                              color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.notification_important,
                         color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                    SizedBox(height: 18,),
                    const Text("Hello,Frankline",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(height: 3,),
                    const Text("Discover what's happening around you",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height:5,),
                    Container(
                      height: 55,
                      padding: const EdgeInsets.only(left: 3),
                      child:TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Search any events...",
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(IconData(0xf068,fontFamily: 'MaterialIcons'))
                        ),
                      ) ,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 15),
              child:
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(IconData(0xf8b2, fontFamily: 'MaterialIcons'),
                            color: Color(0xFFD43642),
                            size: 26,
                          ),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        Text("Confrences",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(IconData(0xede5, fontFamily: 'MaterialIcons'),
                            color: Color(0xFFD43642),
                            size: 26,
                          ),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        Text("Concert",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                              fontWeight: FontWeight.bold

                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(IconData(0xe0f0, fontFamily: 'MaterialIcons'),
                            color: Color(0xFFD43642),
                            size: 26,
                          ),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        Text("Seminars",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                              fontWeight: FontWeight.bold

                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.bubble_chart,
                            color: Color(0xFFD43642),
                            size: 26,
                          ),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        Text("Tradeshows",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                              fontWeight: FontWeight.bold

                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 15,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(right: 20,left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upcoming Events",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54
                  ),
                  ),
                  TextButton(onPressed: (){}, child:
                  Row(
                    children: [
                      Text("See All"),
                      Icon(Icons.arrow_right)
                    ],
                  )
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    child: Container(
                      height: 260,
                      width: 260,
                      padding: EdgeInsets.all(8),
                      child:Column(
                        children: [
                          Container(
                            height: 140,
                            width: 250,
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F647114729%2F322503454361%2F1%2Foriginal.20231123-095900?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C60%2C1920%2C960&s=39691fe5de58259ff906e2df9c75642b'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text('Wed,Apr 28 - 5:30 PM',
                                style: TextStyle(
                                  color: Color(0xFFD43642)
                                ),
                                ),
                                Text('Global Summit for Disaster Risk Reduction 2024',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.pin_drop,
                                    color: Color(0xFFD43642),),
                                    Expanded(
                                      child: Text('Lantana Road Nairobi, Nairobi County',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFFD43642)
                                      ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    child: Container(
                      height: 260,
                      width: 260,
                      padding: EdgeInsets.all(8),
                      child:Column(
                        children: [
                          Container(
                            height: 140,
                            width: 250,
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F647114729%2F322503454361%2F1%2Foriginal.20231123-095900?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C60%2C1920%2C960&s=39691fe5de58259ff906e2df9c75642b'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text('Wed,Apr 28 - 5:30 PM',
                                  style: TextStyle(
                                      color: Color(0xFFD43642)
                                  ),
                                ),
                                Text('Global Summit for Disaster Risk Reduction 2024',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.pin_drop,
                                      color: Color(0xFFD43642),),
                                    Expanded(
                                      child: Text('Lantana Road Nairobi, Nairobi County',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFFD43642)
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    child: Container(
                      height: 290,
                      width: 230,
                      padding: EdgeInsets.all(8),
                      child:Column(
                        children: [
                          Container(
                            height: 140,
                            width: 220,
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F647114729%2F322503454361%2F1%2Foriginal.20231123-095900?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C60%2C1920%2C960&s=39691fe5de58259ff906e2df9c75642b'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text('Wed,Apr 28 - 5:30 PM',
                                  style: TextStyle(
                                      color: Color(0xFFD43642)
                                  ),
                                ),
                                Text('Global Summit for Disaster Risk Reduction 2024',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.pin_drop,
                                      color: Color(0xFFD43642),),
                                    Expanded(
                                      child: Text('Lantana Road Nairobi, Nairobi County',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFFD43642)
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
