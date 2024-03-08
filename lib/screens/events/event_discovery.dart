import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Components/color.dart';
import '../home.dart';
import '../profile.dart';
class EventDiscovery extends StatefulWidget {
  const EventDiscovery({super.key});

  @override
  State<EventDiscovery> createState() => _EventDiscoveryState();
}

class _EventDiscoveryState extends State<EventDiscovery> {

  // Map related variables
  late GoogleMapController mapController;
  LatLng initialMapPosition = LatLng(37.7749, -122.4194); // Initial map position

  // Date and time related variables
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // Function to handle date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // Function to handle time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
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
        title: const Text('Event Discovery',
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
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Map Field
                    const Text("Location",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      ),
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.grey)
                      ),
                      child: GoogleMap(
                        onMapCreated: (GoogleMapController controller) {
                          mapController = controller;
                        },
                        initialCameraPosition: CameraPosition(
                          target: initialMapPosition,
                          zoom: 10.0,
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Date Field with Date Picker
                    InkWell(
                      onTap: () => _selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                            ),
                            Icon(Icons.calendar_today),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Time Field with Time Picker
                    InkWell(
                      onTap: () => _selectTime(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Time',
                          border: OutlineInputBorder(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${selectedTime.format(context)}",
                            ),
                            Icon(Icons.access_time),
                          ],
                        ),
                      ),
                    ),
                    // Submit Button
                  ],
                ),
                GestureDetector(
                  onTap:() {
                    // Handle form submission here
                    print('Map: $initialMapPosition');
                    print('Date: $selectedDate');
                    print('Time: $selectedTime');
                  },
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:const Center(child: Text('Search',
                        style: TextStyle(
                            color: textColor
                        ),
                      ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
