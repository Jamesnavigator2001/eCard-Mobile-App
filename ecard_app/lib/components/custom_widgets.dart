import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//ignore_for_file: must_be_immutable
class HeaderBoldWidget extends StatelessWidget{

  String text;
  Color color;
  String size;

  HeaderBoldWidget({
    super.key,
    required this.text,
    required this.color,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.aBeeZee(
        textStyle: TextStyle(
            color: color,
            fontSize: double.parse(size),
            fontWeight: FontWeight.w900
        )
    ),);
  }
}

class NormalHeaderWidget extends StatelessWidget{
  String text;
  Color color;
  String size;

  NormalHeaderWidget({
    super.key,
    required this.text,
    required this.color,
    required this.size
  });


  @override
  Widget build(BuildContext context) {
    return Text(text , style: GoogleFonts.aBeeZee(
        textStyle: TextStyle(
            color: color,
            fontSize: double.parse(size),
            fontWeight: FontWeight.w500
        )
    ),);  }
}

class HeaderCenterWidget extends StatelessWidget{
  String text;
  Color color;
  String size;

  HeaderCenterWidget({super.key , required this.text , required this.color , required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text , style: GoogleFonts.aBeeZee(
      textStyle: TextStyle(
        color: color,
        fontSize: double.parse(size),
        fontWeight: FontWeight.w500
      )
    ),);
  }
}

class InputField extends StatelessWidget{
  TextEditingController controller;
  String hintText;
  Icon? icon;
  static bool _obscure = true;
  static Icon showIcon = Icon(CupertinoIcons.eye_fill);

  InputField({
    super.key,
    required this.controller,
    this.hintText = "Optional field",
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return
      TextField(
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
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
          prefixIcon: icon
        ),
      );
  }

  static Widget passwordField(BuildContext context,TextEditingController controller , {String hintText="Password"}){
    return TextField(
      controller: controller,
      obscureText: _obscure,
        style: GoogleFonts.nunito(
        textStyle: TextStyle(color: Theme.of(context).primaryColor),
        fontWeight: FontWeight.w500,
        backgroundColor: Colors.white,
        ),
        decoration: InputDecoration(
        prefixIcon: Icon(CupertinoIcons.padlock_solid),
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        suffixIcon: IconButton(onPressed: (){
          if(_obscure){
            _obscure = !_obscure;
            showIcon = Icon(CupertinoIcons.eye_slash_fill);
          }else{
            _obscure = _obscure;
            showIcon = showIcon;
          }
        }, icon: _obscure? showIcon : Icon(CupertinoIcons.eye_slash_fill))
        ));
  }
}

