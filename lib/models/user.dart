import 'package:dataapi/models/userLocation.dart';
import 'package:dataapi/models/user_name.dart';
import 'package:dataapi/models/userdob.dart';

class User{
  final String email;
  final String gender;
  final String phone;
  final String cell;
  final String nat;
  final UserName userName;
  final UserDob dob;
  final UserLocation userLocation;

  User({
    required this.email,
    required this.gender,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.userName,
    required this.dob,
    required this.userLocation
  });
  String get fullName {
    return '${userName.title} ${userName.first} ${userName.last}';
  }

}

