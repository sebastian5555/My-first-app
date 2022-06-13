// ignore_for_file: file_names, avoid_print

import 'package:myapp/client/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/signup.dart';
import 'package:myapp/widgets/textfield.dart';
import 'package:myapp/screens/showinfo.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailcheck = TextEditingController();
  TextEditingController passwordcheck = TextEditingController();
  static late String checkEmail;
  late String checkPassword;
  // late List<String> lookinfo;

  String? validInEmail(String? value) =>
      checkEmail != value!.toLowerCase() ? 'Wrong account' : null;
  String? validInPassword(String? value) =>
      checkPassword != value ? 'Wrong password' : null;

  onPressed() async {
    checkEmail = await DataDB.instance.checkCostumerInfo(0, emailcheck.text);
    checkPassword = await DataDB.instance.checkCostumerInfo(1, emailcheck.text);
    //lookinfo = await DataDB.instance.getCostumerInfo(checkEmail);
    if (formKey.currentState!.validate()) {
      Get.to(ShowInfo());
      // ShowInfoState.firstname = lookinfo[0];
      // ShowInfoState.lastname = lookinfo[1];
      // ShowInfoState.email = lookinfo[2];
      // ShowInfoState.phone = lookinfo[4];
      // ShowInfoState.identification = lookinfo[5];
    } else {
      return;
    }
  }

  @override
  void dispose() {
    emailcheck.dispose();
    passwordcheck.dispose();

    super.dispose();
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
        heightFactor: 1.1,
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
                      'Insert your account',
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
                    margin: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Column(
                      children: [
                        textform(
                          displayText: 'Email',
                          clueText: 'Insert previously created email',
                          inputController: emailcheck,
                          icons: Icons.perm_identity,
                          obscure: false,
                          type: 'email',
                          validator: validInEmail,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        textform(
                          displayText: 'Password',
                          clueText: 'Insert previously created password',
                          inputController: passwordcheck,
                          icons: Icons.lock,
                          obscure: true,
                          type: 'password',
                          validator: validInPassword,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
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
                        'Enter',
                        style: TextStyle(
                            color: Color.fromARGB(255, 43, 1, 51),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 70, right: 40, top: 8),
                    child: Row(
                      children: [
                        const Text(
                          'Dont have an account yet? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 43, 1, 51)),
                        ),
                        TextButton(
                          onPressed: () => Get.to(const SignUp()),
                          child: const Text(
                            'Sign up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 1, 95, 172)),
                          ),
                        ),
                      ],
                    ),
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
