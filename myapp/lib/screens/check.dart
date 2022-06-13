// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  CheckPageState createState() => CheckPageState();
}

class CheckPageState extends State<CheckPage> {
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
                    'Check your sex status!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Text(
                      'Press if you had sex',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromARGB(255, 43, 1, 51),
                      onPressed: null,
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
