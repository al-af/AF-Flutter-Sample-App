import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const MyCustomButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: Colors.deepPurpleAccent,
      textColor: Colors.white,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 18.0, fontFamily: 'MuseoSans-300'),
        ),
      ),
    );
  }
}
