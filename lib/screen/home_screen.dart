import 'package:flutter/material.dart';
import 'package:new_note/model/user.dart';
import 'package:new_note/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Rest API',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final name = user.gender;
            final nat = user.nat;
            final phone = user.phone; 
            final email = user.email;
            return ListTile(
              tileColor: name == 'male'
                  ? const Color.fromARGB(137, 244, 67, 54)
                  : const Color.fromARGB(136, 76, 175, 79),
              leading: CircleAvatar(
                child: Text('${index + 1}'),
                backgroundColor: Colors.grey,
              ),
              title: Text(user.fullName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(phone),
                  Text(email),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUsers();
        },
        backgroundColor: Colors.white,
        shape: CircleBorder(side: BorderSide(strokeAlign: 0.5)),
      ),
    );
  }

  Future<void> fetchUsers()async{
   final response = await UserApi.fetchUsers();

   setState(() {
     users = response;
   });
  }
}
