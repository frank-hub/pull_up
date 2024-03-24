// Set language version to 2.12
// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_up/Components/color.dart';
import 'package:pull_up/screens/home.dart';

import '../../model/event.dart';
import '../profile.dart';

class CreateEvents extends StatefulWidget {
  const CreateEvents({Key? key}) : super(key: key);

  @override
  State<CreateEvents> createState() => _CreateEventsState();
}

class _CreateEventsState extends State<CreateEvents> {
  bool _locationPermissionGranted = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  File? _imageFile;

  Future<void> _getImage() async {

    final status = await Permission.storage.request();

    if (status.isGranted) {
      print('I have been given access !!!');
      final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path as String);
        } else {
          print('No image selected.');
        }
      });
    } else {
      print('I have been given no access !!!');
      final newStatus = await Permission.storage.request();
      print('I have been given access !!!');
      final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path as String);
        } else {
          print('No image selected.');
        }
      });
    }
  }

  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController pricingController = TextEditingController();
  TextEditingController noTicketsController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    setState(() {
      _locationPermissionGranted = status == PermissionStatus.granted;
    });
  }

  String selectedServiceProvider = 'Event Service Providers';
  String event_name = '';
  String eventDescription = '';
  DateTime selectedDateTime = DateTime.now();
  String selectedVenue = '';
  String pricing = '';
  String noTickets = '';

  GoogleMapController? mapController;
  LatLng _selectedLocation = LatLng(1.3, 36.9);

  Future<void> _createEvent() async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://www.culturemambo.pivotnetworks.co.ke/public/api/event/create');
    // final response = await http.post(
    //   url,
    //   body: jsonEncode({
    //     'service': event_name,
    //     'desc': eventDescription,
    //     'date_time': selectedDateTime.toIso8601String(),
    //     'location': selectedVenue,
    //     'price': pricing,
    //     'tickets': noTickets,
    //     // Add other fields as needed
    //   }),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );
    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add text fields to the request
    request.fields['service'] = event_name;
    request.fields['desc'] = eventDescription;
    request.fields['date_time'] = selectedDateTime.toIso8601String();
    request.fields['location'] = selectedVenue;
    request.fields['price'] = pricing;
    request.fields['tickets'] = this._imageFile.toString();
    // Add other fields as needed

    // Add image file to the request
    final _imageFile = this._imageFile;
    if (_imageFile != null) {
      print("Image  uploaded file found");
      var imageStream = http.ByteStream(_imageFile.openRead());
      var length = await _imageFile.length();
      var multipartFile = http.MultipartFile('image', imageStream, length,
          filename: _imageFile.path.split('/').last);
      request.files.add(multipartFile);
      print(multipartFile.filename);

    }

    // Send the request
    var response = await request.send();

    // Process the response
    if (response.statusCode == 200) {
      // Request successful
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Event Successfully Saved'),
          backgroundColor: Colors.green,
        ),
      );
      // Handle the response data
      // Clear text fields
      eventDescriptionController.clear();
      venueController.clear();
      pricingController.clear();
      noTicketsController.clear();
    } else {
      // Request failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save event'),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Event Successfully Saved'),
          backgroundColor: Colors.green,
        ),
      );
      // Event created successfully
      // Parse response JSON to Event object
      // Event createdEvent = Event.fromJson(jsonDecode(response.body));
      // Handle the created event

      // Clear text fields
      eventDescriptionController.clear();
      venueController.clear();
      pricingController.clear();
      noTicketsController.clear();

    } else {
      // Failed to create event
      // Handle the error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save event'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          child: Icon(
            Icons.home,
            color: textColor,
          ),
        ),
        title: const Text(
          'Event Booking',
          style: TextStyle(
            color: textColor,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.account_circle,
                color: textColor,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    value: selectedServiceProvider,
                    onChanged: (newValue) {
                      setState(() {
                        selectedServiceProvider = newValue!;
                      });
                    },
                    items: ['Event Service Providers', 'Influencers', 'Catering', 'Venues']
                        .map((serviceProvider) {
                      return DropdownMenuItem<String>(
                        value: serviceProvider,
                        child: Text(serviceProvider),
                      );
                    }).toList(),
                    hint: Text('Select Service Provider'),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    onChanged:(value){
                      setState(() {
                        event_name = value;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Event Name'
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: eventDescriptionController,
                    onChanged: (value) {
                      setState(() {
                        eventDescription = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Event Description',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                child: Container(
                  child: Column(
                    children: [
                      _imageFile == null
                          ? Placeholder() // Placeholder for image if no image is selected
                          : Image.file(
                        _imageFile!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      ElevatedButton(
                        onPressed: _getImage,
                        child: Text('Upload Image'),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Date and Time'),
                    subtitle: Text(selectedDateTime.toString()),
                    onTap: () async {
                      DateTime? pickedDateTime = await showDatePicker(
                        context: context,
                        initialDate: selectedDateTime,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDateTime != null) {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(selectedDateTime),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            selectedDateTime = DateTime(
                              pickedDateTime.year,
                              pickedDateTime.month,
                              pickedDateTime.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                          });
                        }
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 200.0,
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                    target: _selectedLocation,
                    zoom: 13.0,
                  ),
                  markers: Set<Marker>.of([
                    Marker(
                      markerId: MarkerId('selectedLocation'),
                      position: _selectedLocation,
                    ),
                  ]),
                  onTap: (LatLng latLng) {
                    setState(() {
                      _selectedLocation = latLng;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: venueController,
                    onChanged: (value) {
                      setState(() {
                        selectedVenue = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Event Venue',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: pricingController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        pricing = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Pricing Per Ticket',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: noTicketsController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        noTickets = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Number Of Tickets',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              GestureDetector(
                onTap: _createEvent, // Call _createEvent method on tap
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: Text(
                      'Create Event',
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
