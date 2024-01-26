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
              height: 220,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFD43642),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft:
                Radius.circular(50)
                )
              ),
              child: Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.only(left:10,right: 10,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu,
                        size:30,
                          color: Colors.white,
                        ),
                        Text("Current Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        ),
                        Icon(Icons.notification_important,
                         color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                    SizedBox(height: 18,),
                    const Text("Good Morning Frankline",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.only(left: 3),
                      child:const TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 1
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          icon: Icon(Icons.search,
                          size: 30,
                            color: Colors.white,
                          ),
                          hintText: "I Search...",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                            fontSize: 18,
                          ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.deepOrangeAccent,
                      ),
                      padding: EdgeInsets.all(10),
                      child:const Row(
                        children: [
                          Icon(Icons.bubble_chart,
                            color: Colors.white,
                            size: 26,
                          ),
                          Text("Confrences",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color(0xFFD43642),
                      ),
                      padding: EdgeInsets.all(10),
                      child:const Row(
                        children: [
                          Icon(Icons.bubble_chart,
                            color: Colors.white,
                            size: 26,
                          ),
                          Text("Concert",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color(0xFF29D697),
                      ),
                      padding: EdgeInsets.all(10),
                      child:const Row(
                        children: [
                          Icon(Icons.bubble_chart,
                            color: Colors.white,
                            size: 26,
                          ),
                          Text("Seminars",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color(0xFF46CDFB),
                      ),
                      padding: EdgeInsets.all(10),
                      child:const Row(
                        children: [
                          Icon(Icons.bubble_chart,
                            color: Colors.white,
                            size: 26,
                          ),
                          Text("Tradeshows",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
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
            Column(
              children: [
                Card(
                  child: Container(
                    height: 125,
                    child:Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 130,
                            width: 155,
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
                        ),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                    height: 125,
                    child:Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 130,
                            width: 155,
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F660094379%2F1941358271603%2F1%2Foriginal.20231218-120938?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C88%2C1586%2C793&s=fc4aa9389eaa2622f2443d71f4c2dc66'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Wed,Apr 28 - 5:30 PM',
                                style: TextStyle(
                                    color: Color(0xFFD43642)
                                ),
                              ),
                              Text('Kenya Association of Women in Tourism Conference',
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
                    height: 125,
                    child:Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 130,
                            width: 155,
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F658735679%2F569651512697%2F1%2Foriginal.jpg?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C0%2C2160%2C1080&s=84f65179c6ab63b0ab827b2a8d7bb181'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Wed,Apr 28 - 5:30 PM',
                                style: TextStyle(
                                    color: Color(0xFFD43642)
                                ),
                              ),
                              Text('Eradicating Racism: A Path Forward Learning Series (February 2024)',
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
                    height: 125,
                    child:Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 130,
                            width: 155,
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
                        ),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                    height: 125,
                    child:Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 130,
                            width: 155,
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
                        ),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
            )
          ],
        ),
      ),
    );
  }
}
