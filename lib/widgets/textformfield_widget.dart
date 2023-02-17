import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  const TextFormWidget({
    Key? key,
    required this.controller,
    this.hintText = 'Enter Amount',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        filled: true,
        prefixIcon: const Icon(
          Icons.currency_rupee_rounded,
          color: Colors.black,
        ),
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onSaved: (value) {
        controller.text = value!;
      },
    );
  }
}
