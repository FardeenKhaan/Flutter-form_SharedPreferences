import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_form/screen01.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = "", password = "", name = "";
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  TextEditingController _namecontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
                child: Image.asset(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  'assets/tdo.jpg',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.05),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please see the label tet and then enter regarding';
                              }
                              return null;
                            },
                            controller: _namecontroller,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey,
                                prefixIconColor: Colors.black,
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 30,
                                ),
                                labelText: 'name',
                                labelStyle: TextStyle(color: Colors.black)),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please see the label tet and then enter regarding';
                              }
                              return _emailcontroller.text;
                            },
                            controller: _emailcontroller,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey,
                                prefixIconColor: Colors.black,
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                                // hintText: 'name',
                                labelText: 'E-mail',
                                labelStyle: TextStyle(color: Colors.black)),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please see the label text and then enter regarding';
                              }
                              return null;
                            },
                            controller: _passwordcontroller,
                            obscureText: true,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey,
                                prefixIconColor: Colors.black,
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                ),
                                // hintText: 'name',
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.black)),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),

                      // Padding(padding: EdgeInsets.all(20.0)),
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = _emailcontroller.text;
                              password = _passwordcontroller.text;
                              name = _namecontroller.text;
                            });
                          }
                        },
                        child: GestureDetector(
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString(
                                'email', _emailcontroller.text);
                            await prefs.setString(
                                'password', _passwordcontroller.text);
                            await prefs.setString('name', _namecontroller.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Screen01()));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Center(
                                child: Text(
                                  'Sign UP',
                                  style: GoogleFonts.aboreto(
                                      // backgroundColor: Colors.grey,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'or Login with',
                      style: GoogleFonts.aboreto(fontSize: 15.0),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/google.png',
                        height: 40, width: 30,
                        // height: MediaQuery.of(context).size.height * 0.07,
                        // width: MediaQuery.of(context).size.width * 0.07,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Wrap(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
                              style: TextStyle(
                                  color: Color(0xFF8c8e98),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Screen01()));
                            },
                            child: Text(
                              "LogIn",
                              style: TextStyle(
                                  color: Color(0xFF273671),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ])
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
