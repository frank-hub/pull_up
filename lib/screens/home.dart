import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pull_up/Components/color.dart';
import 'package:pull_up/screens/auth/register.dart';
import 'package:pull_up/screens/events/create_event.dart';
import 'package:pull_up/screens/events/eventDetails.dart';
import 'package:pull_up/screens/events/event_discovery.dart';
import 'package:pull_up/widgets/topbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:convert';


import '../model/event.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final imagesList = ['assets/demo.jpeg','assets/cover.jpg','assets/logo.jpg'];

  int currentIndex = 0;
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final response = await http.get(Uri.parse('https://www.culturemambo.pivotnetworks.co.ke/public/api/event/read'));
    if (response.statusCode == 200) {
      // Decode the response body into a map
      Map<String, dynamic> responseData = json.decode(response.body);

      // Extract the list of events from the map using the appropriate key
      List<dynamic> eventData = responseData['data'];

      setState(() {
        events = eventData.map((data) => Event.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load events');
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),

        child: Column(
          children: [
            const topbar(
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> const RegisterScreen())
                );
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(child: Text("SIGN UP",
                style: TextStyle(
                  color: Color(0xFFD43642),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
                )),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              decoration:const BoxDecoration(
                color: Color(0xff0ff6F1636)
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text("CREATE"+"  "+ "EVENT",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10,
                    ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),

                    ),
                    child:GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const CreateEvents())
                        );
                      },
                      child: const Center(child: Text("CREATE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> EventDiscovery()
                ));
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20,left: 20),
                width: double.infinity,
                child: Card(
                  child: Text("DISCOVER EVENTS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child:ListView.builder(
                itemCount: events.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // Navigate to EventDetails screen with the event id
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => eventDetails(eventId: events[index].id.toString()),
                        ),
                      );
                    },
                    child: Container(
                      height: 317,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    CarouselSlider(
                                      items: imagesList.map((e) {
                                        return Container(
                                          height: 200,
                                          margin: EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(e),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        );
                                      }).toList(),
                                      options: CarouselOptions(
                                        height: 200,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            currentIndex = index;
                                          });
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10, // Adjust this value as needed to position the dots
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: AnimatedSmoothIndicator(
                                          activeIndex: currentIndex,
                                          count: imagesList.length,
                                          effect: const WormEffect(
                                            dotHeight: 8,
                                            dotWidth: 8,
                                            spacing: 5,
                                            dotColor: Colors.white,
                                            activeDotColor: Colors.red,
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                Text(events[index].service ?? 'No date available',
                                  style: const TextStyle(
                                      color: Color(0xFFD43642)
                                  ),
                                ),
                                Text(events[index].desc ?? 'No date available',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.pin_drop,
                                          color: Color(0xFFD43642),),
                                        Expanded(
                                          child: Text(events[index].location ?? 'No date available',
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Color(0xFFD43642)
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          events[index].price ?? 'No date available',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.red
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
