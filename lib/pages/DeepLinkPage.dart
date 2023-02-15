import 'package:af_flutter_sample_app/widgets_utils/Header.dart';
import 'package:flutter/material.dart';

class DeepLinkPage extends StatefulWidget {
  final String? deepLinkString;
  const DeepLinkPage(this.deepLinkString);

  @override
  _DeepLinkPageState createState() => _DeepLinkPageState();
}

class _DeepLinkPageState extends State<DeepLinkPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Header(headerText: "Deep Link Page"),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple, width: 1.5),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.all(20),
                child: SelectableText(
                  widget.deepLinkString!,
                  style: TextStyle(fontFamily: 'MuseoSans-300'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
