import 'dart:convert';
import 'package:dataapi/models/user.dart';
import 'package:dataapi/services/user_api.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  late int userCount;
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  // Future fetchUser()async{
  //   final url = "https://randomuser.me/api/?results=$userCount";
  //   final Response = await http.get(Uri.parse(url));
  //   final body = jsonDecode(Response.body);
  //   List result = body['results'] as List;
  //
  //   final transform = result.map((e) {
  //     final name = UserName(
  //         title:e['name']["title"] ,
  //         first: e['name']["first"] ,
  //         last: e['name']["last"] );
  //     return User(
  //         email: e['email'],
  //         nat: e['nat'],
  //         cell: e['cell'],
  //         gender: e['gender'],
  //         phone: e['phone'],
  //         userName: name
  //
  //     );
  //   }).toList();
  //
  //   setState(() {
  //     users = transform;
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  //   print(users);
  // }
  @override
  void initState() {
    fetchUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchUser,
      // ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  Profile(name:users[index]['email'])),
                // );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: users[index].gender=='male'?Colors.red:Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    title: Text(users[index].fullName),
                    leading: CircleAvatar(
                      child: Text(users[index].dob.age.toString())
                    ),
                    subtitle: Text(users[index].userLocation.street.name),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }

  Future <void>fetchUser() async{
    final response = await UserApi.fetchUser();
    setState(() {
      users = response;
    });
  }

}




