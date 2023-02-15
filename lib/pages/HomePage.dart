import 'dart:io';

import 'package:af_flutter_sample_app/AFManager.dart';
import 'package:af_flutter_sample_app/app_constants.dart';
import 'package:af_flutter_sample_app/pages/DeepLinkPage.dart';
import 'package:af_flutter_sample_app/widgets_utils/CheckBoxRow.dart';
import 'package:af_flutter_sample_app/widgets_utils/MyCustomButton.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MoreActionPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> _checkboxStates = [true, true];
  List<bool> get checkboxStates => _checkboxStates;
  set checkboxStates(List<bool> newCheckboxStates) {
    _checkboxStates = newCheckboxStates;
  }

  int currentState =
      AppConstants.DEFAULT; //-1 = DEFAULT , 0 - SDK STOP , 1 - SDK STARTED
  final _appInviteIdController = TextEditingController();
  final _udlTimeoutController = TextEditingController();
  final _cuidController = TextEditingController();
  final _hostController = TextEditingController();
  final _hostPrefixController = TextEditingController();
  final _waitForATTController = TextEditingController();

  final Text descInitStart = const Text(AppConstants.DESC_INIT_START);
  final Text descStop = const Text(AppConstants.DESC_STOP);

  String get appInviteId => _appInviteIdController.text;

  String get waitForATT => _waitForATTController.text;

  String get udlTimeout => _udlTimeoutController.text;

  String get cuid => _cuidController.text;

  String get host => _hostController.text;

  String get hostPrefix => _hostPrefixController.text;

  bool get useUDL => checkboxStates[0];

  bool get defferedStart => checkboxStates[1];

  bool isStart = false;
  bool isStop = false;
  bool isDialogShown = false;
  AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
      afDevKey: AppConstants.DEV_KEY,
      appId: AppConstants.APP_ID,
      timeToWaitForATTUserAuthorization: 50.0,
      showDebug: true);
  late AppsflyerSdk appsFlyerSdk;

  @override
  void initState() {
    currentState = AppConstants.DEFAULT;
    if (!defferedStart) {
      afStart();
    }
    super.initState();
  }

  void changeState() {
    setState(() {
      if (currentState == AppConstants.START_SDK) {
        currentState = AppConstants.STOP_SDK;
      } else {
        currentState = AppConstants.START_SDK;
      }
    });
  }

  @override
  void dispose() {
    _appInviteIdController.dispose();
    _udlTimeoutController.dispose();
    _cuidController.dispose();
    _hostController.dispose();
    _hostPrefixController.dispose();
    _waitForATTController.dispose();
    super.dispose();
  }

  afStart() {
    if (currentState != AppConstants.START_SDK) {
      changeState();
    }

    if (waitForATT.isNotEmpty) {
      setATTifNeeded();
    }

    appsFlyerSdk =
        AFManager().getAFObject(appsFlyerOptions); //AppConstants.APP_ID

    if (Platform.isIOS) {
      final status = AppTrackingTransparency.requestTrackingAuthorization();
    }

    setCuidIfNeeded();
    setHostIfNeeded();

    if (appInviteId.isNotEmpty) {
      appsFlyerSdk.setAppInviteOneLinkID(appInviteId, (res) {
        print("setAppInviteOneLinkID callback: $res");
      });
    }

    appsFlyerSdk.onInstallConversionData((res) {
      print("res: " + res.toString());
      if (!isDialogShown) {
        showMyDialog(context, res.toString());
        isDialogShown = true;
      }
    });

    appsFlyerSdk.onAppOpenAttribution((res) {
      print("res: " + res.toString());
      moveToDeepLinkPage(res.toString());
    });

    appsFlyerSdk.onDeepLinking((DeepLinkResult dp) {
      switch (dp.status) {
        case Status.FOUND:
          var dpData = dp.deepLink?.toString();
          print(dpData);
          print("deep link value: ${dp.deepLink?.deepLinkValue}");
          moveToDeepLinkPage(dpData);
          break;
        case Status.NOT_FOUND:
          print("deep link not found");
          break;
        case Status.ERROR:
          print("deep link error: ${dp.error}");
          break;
        case Status.PARSE_ERROR:
          print("deep link status parsing error");
          break;
      }
    });

    appsFlyerSdk.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: useUDL);
  }

  void setATTifNeeded() {
    appsFlyerOptions = AppsFlyerOptions(
        afDevKey: AppConstants.DEV_KEY,
        appId: AppConstants.APP_ID,
        timeToWaitForATTUserAuthorization: double.tryParse(waitForATT),
        showDebug: true);
  }

  afStop() {
    if (currentState == AppConstants.START_SDK) {
      changeState();
    }
    appsFlyerSdk.stop(true);
  }

  moreActionPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MoreActionPage()),
    );
  }

  moveToDeepLinkPage(String? deepLinkString) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DeepLinkPage(deepLinkString)),
    );
  }

  Future<void> showMyDialog(BuildContext context, String res) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.white,
          title: Text('Conversion Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      minHeight: 100.0, minWidth: double.infinity),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepPurple,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      res,
                      maxLines: null,
                      style: const TextStyle(
                          fontSize: 16.0, fontFamily: 'MuseoSans-300'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MyCustomButton(
                buttonText: 'OK',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //Start region: Logo
            Stack(
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
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        resetAll();
                      });
                    },
                  ),
                ),
              ],
            ),
            //End region: Logo
            //Start region: Informative Text about the SDK state
            Container(
              margin: const EdgeInsets.only(top: 12),
              alignment: Alignment.center,
              width: double.infinity,
              child: SizedBox(
                height: 24,
                child: getCurrentSDKState(),
              ),
            ),
            //End region: Informative Text about the SDK state
            //Start region: Check Box List
            Column(
              children: [
                CheckboxRow(
                  value: checkboxStates[0],
                  label: AppConstants.USE_UDL,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxStates[0] = value!;
                    });
                  },
                ),
                CheckboxRow(
                  value: checkboxStates[1],
                  label: AppConstants.DEFERRED_START,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxStates[1] = value!;
                    });
                  },
                )
              ],
            ),
            //End region: Check Box List
            //Start region: Text Field List
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (Platform.isIOS)
                          Padding(
                            padding: AppConstants.EDGE_INSETS_TEXT_FIELD,
                            child: TextField(
                              controller: _waitForATTController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: AppConstants.HINT_WAIT_FOR_ATT),
                            ),
                          ),
                        Padding(
                          padding: AppConstants.EDGE_INSETS_TEXT_FIELD,
                          child: TextField(
                            controller: _appInviteIdController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: AppConstants.HINT_APP_INVITE),
                          ),
                        ),
                        Padding(
                          padding: AppConstants.EDGE_INSETS_TEXT_FIELD,
                          child: TextField(
                            controller: _udlTimeoutController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: AppConstants.HINT_UDL_TIMEOUT),
                          ),
                        ),
                        Padding(
                          padding: AppConstants.EDGE_INSETS_TEXT_FIELD,
                          child: TextField(
                            controller: _cuidController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: AppConstants.HINT_CUID),
                          ),
                        ),
                        Padding(
                          padding: AppConstants.EDGE_INSETS_TEXT_FIELD,
                          child: TextField(
                            controller: _hostController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: AppConstants.HINT_HOST),
                          ),
                        ),
                        Padding(
                          padding: AppConstants.EDGE_INSETS_TEXT_FIELD,
                          child: TextField(
                            controller: _hostPrefixController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: AppConstants.HINT_HOST_PREFIX),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //End region: Text Field List
            //Start region: Buttons List
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCustomButton(
                      onPressed: afStart, buttonText: AppConstants.BTN_START),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCustomButton(
                      onPressed: afStop, buttonText: AppConstants.BTN_STOP),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCustomButton(
                      onPressed: moreActionPage,
                      buttonText: AppConstants.BTN_MORE_ACTIONS),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void resetAll() {
    checkboxStates = List<bool>.filled(checkboxStates.length, false);
    _appInviteIdController.text = '';
    _udlTimeoutController.text = '';
    _cuidController.text = '';
    _hostController.text = '';
    _hostPrefixController.text = '';
    _waitForATTController.text = '';
  }

  Text getCurrentSDKState() {
    if (currentState == AppConstants.START_SDK) {
      return const Text(AppConstants.DESC_INIT_START,
          style: TextStyle(fontFamily: 'MuseoSans-300'));
    } else if (currentState == AppConstants.STOP_SDK) {
      return const Text(AppConstants.DESC_STOP,
          style: TextStyle(fontFamily: 'MuseoSans-300'));
    } else if (currentState == AppConstants.DEFAULT) {
      return const Text(AppConstants.DESC_DEFAULT,
          style: TextStyle(fontFamily: 'MuseoSans-300'));
    } else {
      return const Text(AppConstants.DESC_DEFAULT,
          style: TextStyle(fontFamily: 'MuseoSans-300'));
    }
  }

  void setCuidIfNeeded() {
    if (!checkboxStates[1]) {
      if (cuid != null && cuid.isNotEmpty) {
        appsFlyerSdk.setCustomerUserId(cuid);
      }
    }
  }

  void setHostIfNeeded() {
    if (host.isEmpty) {
      appsFlyerSdk.setHost("", "appsflyer.com");
    } else {
      appsFlyerSdk.setHost(hostPrefix, host);
    }
  }
}
