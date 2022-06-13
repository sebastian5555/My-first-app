// ignore_for_file:camel_case_types
import 'package:flutter/material.dart';
import 'package:myapp/widgets/validators.dart';

class textform extends StatefulWidget {
  final String displayText;
  final String clueText;
  final TextEditingController inputController;
  final bool obscure;
  final IconData icons;
  final String type;
  final String? Function(String?)? validator;

  const textform({
    Key? key,
    required this.displayText,
    required this.clueText,
    required this.inputController,
    required this.obscure,
    required this.icons,
    required this.type,
    required this.validator,
  }) : super(key: key);

  @override
  textformState createState() => textformState();
}

class textformState extends State<textform> {
  @override
  void initState() {
    super.initState();
    widget.inputController.addListener(onListen);
  }

  @override
  void dispose() {
    widget.inputController.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.inputController,
        obscureText: widget.obscure,
        keyboardType: keyboard(widget.type),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.white),
          labelText: widget.displayText,
          hintStyle: const TextStyle(color: Colors.grey),
          hintText: widget.clueText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: Icon(widget.icons),
          suffixIcon: widget.inputController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => widget.inputController.clear(),
                ),
        ),
        validator: widget.validator,
      );
}
