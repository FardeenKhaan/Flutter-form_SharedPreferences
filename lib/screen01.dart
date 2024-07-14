import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen01 extends StatefulWidget {
  const Screen01({super.key});

  @override
  State<Screen01> createState() => _Screen01State();
}

class _Screen01State extends State<Screen01> {
  var email = '';
  var password = '';
  var name = '';

  @override
  void initState() {
    // TODO: implement initState
    getSavedData();
    super.initState();
  }

  getSavedData() async {
    final prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name')!;
    email = prefs.getString('email')!;
    password = prefs.getString('password')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ' +
                  name +
                  ' \n' +
                  'E-mail: ' +
                  email +
                  ' \n' +
                  'Password: ' +
                  password,
              style: TextStyle(color: Colors.grey, fontSize: 35.0),
            )
          ],
        ),
      ),
    );
  }
}
