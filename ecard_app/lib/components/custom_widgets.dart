import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//ignore_for_file: must_be_immutable
class HeaderBoldWidget extends StatelessWidget {
  String text;
  Color color;
  String size;

  HeaderBoldWidget(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
          textStyle: TextStyle(
              color: color,
              fontSize: double.parse(size),
              fontWeight: FontWeight.w900)),
    );
  }
}

class NormalHeaderWidget extends StatelessWidget {
  String text;
  Color color;
  String size;

  NormalHeaderWidget(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
          textStyle: TextStyle(
              color: color,
              fontSize: double.parse(size),
              fontWeight: FontWeight.w500)),
    );
  }
}

class HeaderCenterWidget extends StatelessWidget {
  String text;
  Color color;
  String size;

  HeaderCenterWidget(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
          textStyle: TextStyle(
              color: color,
              fontSize: double.parse(size),
              fontWeight: FontWeight.w500)),
    );
  }
}

class InputField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  Icon? icon;
  String? _field;
  InputField(
      {super.key,
      required this.controller,
      this.hintText = "Optional field",
      required this.icon});

  String? validateInputField(String? text) {
    if (text == null || text == "" || text.isEmpty) {
      return "";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      onSaved: (value) => _field = value,
      validator: validateInputField,
      controller: controller,
      cursorColor: Theme.of(context).primaryColor,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(color: Theme.of(context).primaryColor),
        fontWeight: FontWeight.w500,
        backgroundColor: Colors.white,
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          prefixIcon: icon),
    );
  }
}
