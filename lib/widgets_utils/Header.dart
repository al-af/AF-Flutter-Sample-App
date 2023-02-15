import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';

class Header extends StatelessWidget {
  final String headerText;

  const Header({
    Key? key,
    required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          alignment: Alignment.center,
          width: double.infinity,
          height: 100,
          child: const Image(
            image: AssetImage(AppConstants.LOGO_PATH),
          ),
        ),
        Container(
          height: 60.0,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          alignment: Alignment.center,
          child: Text(
            headerText,
            style: const TextStyle(
              fontFamily: 'MuseoSans-300',
              fontSize: 20.0,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
