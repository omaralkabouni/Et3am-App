
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.2 ,  left: MediaQuery.of(context).size.width * 0.05),
   
      height: MediaQuery.of(context).size.width * 0.3,
      width: MediaQuery.of(context).size.width,
      child:  Text('Et3am' , style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: MediaQuery.of(context).size.width * .25,
        fontWeight: FontWeight.bold
      ),),
    );
  }
}
