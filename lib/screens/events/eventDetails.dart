import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pull_up/screens/events/buy_rsvp.dart';

import '../../Components/color.dart';
import '../../model/event.dart';
import '../home.dart';
import '../profile.dart';
import 'package:http/http.dart' as http;


class eventDetails extends StatefulWidget {
  final String eventId;

  const eventDetails({super.key, required this.eventId});

  @override
  State<eventDetails> createState() => _eventDetailsState();
}

class _eventDetailsState extends State<eventDetails> {
  late Event event = Event();

  @override
  void initState() {
    super.initState();
    fetchEventDetails();
  }

  Future<void> fetchEventDetails() async {
    final url = Uri.parse('https://culturemambo.pivotnetworks.co.ke/public/api/event/details/${widget.eventId}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decode the response body
      Map<String, dynamic> responseData = json.decode(response.body);

      // Extract the event details from the "data" object
      Map<String, dynamic> eventData = responseData['data'];

      setState(() {
        // Pass the extracted event data to Event.fromJson
        event = Event.fromJson(eventData);
      });
    } else {
      throw Exception('Failed to load event details');
    }
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Discover Events",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/demo.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(height: 20,),
              Text(event.service ?? '',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(event.desc ?? ''),
              SizedBox(height: 20,),
              Text("Date: ${event.date_time}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.blueGrey
              ),
              ),
              SizedBox(height: 5,),
              Text('Time: ${event.date_time}',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey
                ),
              ),
              SizedBox(height: 5,),
              Text('Location: ${event.location}',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey
                ),
              ),
              SizedBox(height: 5,),
              Text("Price: ${event.price}",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey
                ),),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder:
                  (context)=> BuyRsvp()
                  )
                  );
                },
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:const Center(child: Text('BUY / RSVP',
                      style: TextStyle(
                          color: textColor
                      ),
                    ))),
              ),
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
      ),
    );
  }
}
