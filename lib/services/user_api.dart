import 'dart:convert';

import 'package:dataapi/models/user.dart';
import 'package:dataapi/models/userLocation.dart';
import 'package:dataapi/models/user_name.dart';
import 'package:dataapi/models/userdob.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUser()async{
    final url = "https://randomuser.me/api/?results=50";
    final Response = await http.get(Uri.parse(url));
    final body = jsonDecode(Response.body);
    List<dynamic> result = body['results'] as List;

    final users = result.map((e) {
      final name = UserName(
          title:e['name']["title"] ,
          first: e['name']["first"] ,
          last: e['name']["last"] );

      final dob = UserDob(
          age: e['dob']['age'],
          date: DateTime.parse(e['dob']['date']).toUtc());

      final coordinate = LocationCoordinate(
          latitude: e['location']['coordinates']['latitude'],
          longitude: e['location']['coordinates']['longitude']
      );
      final street = LocationStreet(
          name: e['location']['street']['name'],
          number: e['location']['street']['number']);
      final timezone =LocationTimezone (
          description:  e['location']['timezone']['description'],
          offset: e['location']['timezone']['offset']
          );

      final location = UserLocation(
          city: e['location']['city'],
          state: e['location']['state'],
          country: e['location']['country'],
          postcode: e['location']['postcode'].toString(),
          street: street,
          coordinate: coordinate,
          timezone: timezone
      );
      return User(
          email: e['email'],
          nat: e['nat'],
          cell: e['cell'],
          gender: e['gender'],
          phone: e['phone'],
          userName: name,
          dob: dob,
          userLocation: location

      );
    }).toList();
    return users;
  }
}