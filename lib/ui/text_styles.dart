import 'package:flutter/material.dart';


TextStyle titleStyle(context){
  return TextStyle(
    fontSize: MediaQuery.of(context).size.width*0.07,
    fontWeight: FontWeight.normal,
  );
}

TextStyle subTitleStyle(context){
  return TextStyle(
    fontSize: MediaQuery.of(context).size.width*0.03,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold
  );
}