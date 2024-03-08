// event.dart
class Event {
  int? id;
  String? service;
  String? desc;
  String? price;
  String? tickets;
  String? date_time;
  String? location;

  Event({
    this.id,
    this.service,
    this.desc,
    this.price,
    this.tickets,
    this.date_time,
    this.location,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      service: json['service'],
      desc: json['desc'],
      price: json['price'],
      tickets: json['tickets'],
      date_time: json['date_time'],
      location: json['location'],
    );
  }
}
