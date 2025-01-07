
import 'package:flutter/material.dart';

class Routingpage{
  static gotonext({required BuildContext context,required Widget navigateto}){
    return Navigator.of(context).push(MaterialPageRoute(builder: (context)=>navigateto));
  }
  static pushreplase({required BuildContext context,required Widget navigateto}){
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>navigateto));
  }
}