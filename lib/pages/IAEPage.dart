import 'dart:convert';

import 'package:af_flutter_sample_app/AFManager.dart';
import 'package:af_flutter_sample_app/app_constants.dart';
import 'package:af_flutter_sample_app/widgets_utils/Header.dart';
import 'package:af_flutter_sample_app/widgets_utils/MyCustomButton.dart';
import 'package:flutter/material.dart';

class IAEPage extends StatefulWidget {
  const IAEPage({Key? key}) : super(key: key);

  @override
  State<IAEPage> createState() => _IAEPageState();
}

class _IAEPageState extends State<IAEPage> {
  var appsflyerSdk = AFManager().appsflyerSdk;
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventJsonController = TextEditingController();
  TextEditingController iaeResponseController = TextEditingController();
  String logEventResponse = "No event have been sent";

  @override
  void dispose() {
    eventNameController.dispose();
    eventJsonController.dispose();
    iaeResponseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Header(headerText: AppConstants.LABEL_IAE_PAGE),
              ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: 80.0, minWidth: double.infinity),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    logEventResponse,
                    maxLines: null,
                    style: const TextStyle(
                        fontSize: 16.0, fontFamily: 'MuseoSans-300'),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              MyCustomButton(
                  onPressed: regularIAE, buttonText: AppConstants.BTN_REG_IAE),
              const SizedBox(height: 10.0),
              MyCustomButton(
                  onPressed: purchaseIAE,
                  buttonText: AppConstants.BTN_PURCHASE_IAE),
              const SizedBox(height: 20.0),
              TextField(
                decoration: const InputDecoration(
                  hintText: AppConstants.HINT_EVENT_NAME,
                ),
                controller: eventNameController,
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  hintText: AppConstants.HINT_EVENT_JSON,
                  suffixIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        eventJsonController.text = AppConstants.JSON_EXAMPLE;
                      });
                    },
                    child: Icon(Icons.description_outlined),
                  ),
                ),
                controller: eventJsonController,
              ),
              const SizedBox(height: 20.0),
              MyCustomButton(
                  onPressed: () {
                    if (eventNameController.text.isNotEmpty &&
                        eventJsonController.text.isNotEmpty) {
                      customIAE(
                          eventNameController.text, eventJsonController.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Event Name or Event JSON are empty!")));
                    }
                  },
                  buttonText: AppConstants.BTN_CUSTOM_IAE),
            ],
          ),
        ),
      ),
    );
  }

  void regularIAE() {
    const String eventName = "Demo Regular Event";

    final Map eventValues = {
      "app": "Flutter Demo App",
      "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
    };

    appsflyerSdk.logEvent(eventName, eventValues).then((onValue) {
      setState(() {
        logEventResponse =
            "Success! \nEvent Name: $eventName \nEvent Values: $eventValues";
      });
    }).catchError((onError) {
      setState(() {
        logEventResponse = "FAILURE! \nError: ${onError.toString()}";
      });
    });
  }

  void purchaseIAE() {
    const String eventName = "Demo Purchase Event";

    final Map eventValues = {
      "af_content_id": "id123",
      "af_currency": "USD",
      "af_revenue": "20",
      "af_coupon_code": "CODE_20"
    };

    appsflyerSdk.logEvent(eventName, eventValues).then((onValue) {
      setState(() {
        logEventResponse =
            "Success! \nEvent Name: $eventName \nEvent Values: $eventValues";
      });
    }).catchError((onError) {
      setState(() {
        logEventResponse = "FAILURE! \nError: ${onError.toString()}";
      });
    });
  }

  void customIAE(String eventName, String eventValues) {
    var fixedJson = fixJsonString(eventValues);
    appsflyerSdk.logEvent(eventName, jsonDecode(fixedJson)).then((onValue) {
      setState(() {
        logEventResponse =
            "Success! \nEvent Name: $eventName \nEvent Values: $eventValues";
      });
    }).catchError((onError) {
      setState(() {
        logEventResponse = "FAILURE! \nError: ${onError.toString()}";
      });
    });
  }

  String fixJsonString(String jsonString) {
    // Replace curly quotes with straight quotes
    jsonString = jsonString.replaceAll('“', '"').replaceAll('”', '"');

    return jsonString;
  }
}
