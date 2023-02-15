import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'deviceDataDesign/AndroidDesign.dart';
import 'deviceDataDesign/iOSDesign.dart';

class DeviceDataPage extends StatefulWidget {
  const DeviceDataPage({Key? key}) : super(key: key);

  @override
  State<DeviceDataPage> createState() => _DeviceDataPageState();
}

class _DeviceDataPageState extends State<DeviceDataPage> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return iOSDesign();
    } else if (Platform.isAndroid) {
      return AndroidDesign();
    }
    return Container();
  }
}
