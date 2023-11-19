
import 'package:flutter/material.dart';

Color color = const Color(0xff82498d);

//style of border for textField
OutlineInputBorder myInputBorder(){
  return    OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: color.withOpacity(0.7),width: 2)
  );
}

//style of focus border for textField
OutlineInputBorder myFocusBorder(){
  return    OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: color,width: 2)
  );
}

//style of focus border for textField
OutlineInputBorder myErrorBorder(){
  return   const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: Colors.red,width: 2)
  );
}