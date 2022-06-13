// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup.dart';
import 'signin.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      backgroundColor: Colors.purple,
      body: Center(
        heightFactor: 1.2,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 50),
                  child: const Text(
                    'CHECK YOUR DATA!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () => Get.to(const SignIn()),
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 43, 1, 51)),
                    )),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () => Get.to(const SignUp()),
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: const Text(
                      'Create new account',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 43, 1, 51)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
