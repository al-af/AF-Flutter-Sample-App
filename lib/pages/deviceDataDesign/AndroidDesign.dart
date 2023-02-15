import 'package:advertising_info/advertising_info.dart';
import 'package:af_flutter_sample_app/AFManager.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';

import '../../app_constants.dart';
import '../../widgets_utils/Header.dart';
import '../../widgets_utils/MyCustomButton.dart';

class AndroidDesign extends StatefulWidget {
  @override
  _AndroidDesignState createState() => _AndroidDesignState();
}

class _AndroidDesignState extends State<AndroidDesign> {
  String gaid = "Loading...";
  AppsflyerSdk appsflyerSdk = AFManager().appsflyerSdk;
  @override
  void initState() {
    super.initState();
    getGaid().then((result) {
      setState(() {
        gaid = result!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Header(headerText: AppConstants.LABEL_DEVICE_DATA_PAGE),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(AppConstants.LABEL_GAID),
                      subtitle: Text(gaid),
                    ),
                    MyCustomButton(
                        onPressed: () {
                          appsflyerSdk.setDisableAdvertisingIdentifiers(true);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Advertising Identifiers collection disabled!")));
                        },
                        buttonText: AppConstants.BTN_DISABLE_GAID)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<String?> getGaid() async {
  late String? gaid;
  AdvertisingInfo advertisingInfo;
  try {
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    advertisingInfo = await AdvertisingInfo.read();
    gaid = advertisingInfo.id;
  } catch (e) {
    print('Error getting GAID: $e');
  }
  return gaid;
}
