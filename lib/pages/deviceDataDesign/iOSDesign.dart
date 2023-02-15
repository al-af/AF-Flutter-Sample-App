import 'package:advertising_id/advertising_id.dart';
import 'package:af_flutter_sample_app/AFManager.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_constants.dart';
import '../../widgets_utils/Header.dart';
import '../../widgets_utils/MyCustomButton.dart';

class iOSDesign extends StatefulWidget {
  @override
  _iOSDesignState createState() => _iOSDesignState();
}

class _iOSDesignState extends State<iOSDesign> {
  String idfa = "Loading...";
  String idfv = "Loading...";
  AppsflyerSdk appsflyerSdk = AFManager().appsflyerSdk;
  @override
  void initState() {
    super.initState();
    getIdfv().then((result) {
      setState(() {
        idfv = result;
      });
    });
    getIdfa().then((result) {
      setState(() {
        idfa = result!;
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
                      title: Text(AppConstants.LABEL_IDFA),
                      subtitle: Text(idfa),
                    ),
                    ListTile(
                      title: Text(AppConstants.LABEL_IDFV),
                      subtitle: Text(idfv),
                    ),
                    const SizedBox(height: 20),
                    MyCustomButton(
                        onPressed: () {
                          appsflyerSdk.setDisableAdvertisingIdentifiers(true);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Advertising Identifiers collection disabled!")));
                        },
                        buttonText: AppConstants.BTN_DISABLE_IDFA)
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

Future<String> getIdfv() async {
  late String idfv;
  try {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    idfv = iosInfo.identifierForVendor.toString();
  } catch (e) {
    print('Error getting IDFV: $e');
  }
  return idfv;
}

Future<String?> getIdfa() async {
  late String? idfa = "0000";
  try {
    idfa = await AdvertisingId.id(true);
  } catch (e) {
    print('Error getting IDFA: $e');
  }
  return idfa;
}
