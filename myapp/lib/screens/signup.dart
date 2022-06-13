// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:myapp/client/costumer.dart';
import 'package:myapp/client/database.dart';
import 'package:myapp/widgets/textfield.dart';
import 'package:myapp/screens/firstPage.dart';
import 'package:get/get.dart';
import 'package:myapp/widgets/validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController identification = TextEditingController();

  void onPressed() async {
    if (formKey.currentState!.validate()) {
      Get.to(const MyHomePage());
      //await DataDB.instance.removeAllCostumer();
      await DataDB.instance.addCostumer(Costumer(
          firstname: firstname.text,
          lastname: lastname.text,
          email: email.text.toLowerCase(),
          password: password.text,
          phone: phone.text,
          identification: identification.text));
      await DataDB.instance.getCostumerInfo(email.text);
    } else {
      return;
    }
  }

  String? validCpassword(String? value) =>
      password.text != value ? 'Passwords don\'t match' : null;

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    identification.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        // title: const Text('App', style: TextStyle(color: Colors.red)),
      ),
      backgroundColor: Colors.purple,
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 50),
                    child: const Text(
                      'Sing Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        textform(
                          displayText: 'Firstname',
                          clueText: 'Joe',
                          inputController: firstname,
                          obscure: false,
                          icons: Icons.perm_identity,
                          type: 'field',
                          validator: validField,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        textform(
                          displayText: 'Lastname',
                          clueText: 'Mamma',
                          inputController: lastname,
                          obscure: false,
                          icons: Icons.perm_identity_sharp,
                          type: 'field',
                          validator: validField,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        textform(
                          displayText: 'Email',
                          clueText: 'joe@mamma.com',
                          inputController: email,
                          obscure: false,
                          icons: Icons.email,
                          type: 'email',
                          validator: validEmail,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        textform(
                          displayText: 'Password',
                          clueText: 'Joe_Mamma25',
                          inputController: password,
                          obscure: false,
                          icons: Icons.lock,
                          type: 'password',
                          validator: validPassword,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        textform(
                          displayText: 'Confirm Password',
                          clueText: '',
                          inputController: confirmPassword,
                          obscure: true,
                          icons: Icons.lock,
                          type: 'password',
                          validator: validCpassword,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        textform(
                          displayText: 'Phone',
                          clueText: '555-555-5555',
                          inputController: phone,
                          obscure: false,
                          icons: Icons.local_phone_rounded,
                          type: 'phone',
                          validator: validPhone,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        textform(
                          displayText: 'Id',
                          clueText: '1234567890',
                          inputController: identification,
                          obscure: false,
                          icons: Icons.assignment_ind_outlined,
                          type: 'phone',
                          validator: validPhone,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 125,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: onPressed,
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            color: Color.fromARGB(255, 43, 1, 51),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
