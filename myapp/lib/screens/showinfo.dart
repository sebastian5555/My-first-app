// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:myapp/client/database.dart';
import 'package:myapp/widgets/row.dart';
import 'package:myapp/screens/signin.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/firstpage.dart';
import 'package:myapp/screens/check.dart';

class ShowInfo extends StatefulWidget {
  const ShowInfo({Key? key}) : super(key: key);

  @override
  ShowInfoState createState() => ShowInfoState();
}

class ShowInfoState extends State<ShowInfo> {
  late List<String> lookinfo;
  static late String firstname = '';
  static late String lastname = '';
  static late String email = '';
  static late String phone = '';
  static late String identification = '';

  onPressed() async {
    lookinfo = await DataDB.instance.getCostumerInfo(SignInState.checkEmail);
    setState(() {
      firstname = lookinfo[0];
      lastname = lookinfo[1];
      email = lookinfo[2];
      phone = lookinfo[4];
      identification = lookinfo[5];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      backgroundColor: Colors.purple,
      body: Center(
        heightFactor: 0.8,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 100),
                  child: const Text(
                    'See your data!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: onPressed, //() => onPressed(),
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: const Text(
                      'Show',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 1, 51),
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      const rowfield(
                        displayFText: 'Firstname',
                        displaySText: 'Lastname',
                        type: 'title',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      rowfield(
                        displayFText: firstname,
                        displaySText: lastname,
                        type: 'info',
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Center(
                        child: rowfield(
                            displayFText: 'Email',
                            displaySText: '',
                            type: 'title'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      rowfield(
                          displayFText: email, displaySText: '', type: 'info'),
                      const SizedBox(
                        height: 50,
                      ),
                      const rowfield(
                        displayFText: 'Phone',
                        displaySText: 'Identification',
                        type: 'title',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      rowfield(
                        displayFText: phone,
                        displaySText: identification,
                        type: 'info',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(35),
                  child: Center(
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: const Text(
                            'Try again',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 43, 1, 51),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        ElevatedButton(
                            onPressed: () => Get.to(const CheckPage()),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 43, 1, 51),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
