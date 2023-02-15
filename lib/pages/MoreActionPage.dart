import 'package:af_flutter_sample_app/widgets_utils/Header.dart';
import 'package:af_flutter_sample_app/widgets_utils/MyCustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';
import 'DeviceDataPage.dart';
import 'IAEPage.dart';
import 'UserInvitePage.dart';

class MoreActionPage extends StatefulWidget {
  const MoreActionPage({Key? key}) : super(key: key);

  @override
  State<MoreActionPage> createState() => _MoreActionPageState();
}

class _MoreActionPageState extends State<MoreActionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Header(headerText: AppConstants.LABEL_MORE_ACTIONS_PAGE),
            Column(
              children: [
                //Start Region: Move to IAE Page
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCustomButton(
                    onPressed: MoveToIAEPage,
                    buttonText: AppConstants.BTN_IAE,
                  ),
                ),
                //End Region: Move to IAE Page
                //Start Region: Move to User Invite Page
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCustomButton(
                    onPressed: MoveToUserInvitePage,
                    buttonText: AppConstants.BTN_USER_INVITE,
                  ),
                ),
                //End Region: Move to User Invite Page
                //Start Region: Move to Device Data Page
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyCustomButton(
                    onPressed: MoveToDeviceDataPage,
                    buttonText: AppConstants.BTN_DEVICE_DATA,
                  ),
                ),
                //End Region: Move to Device Data Page
              ],
            ),
          ],
        ),
      ),
    );
  }

  void MoveToIAEPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const IAEPage()),
    );
  }

  void MoveToUserInvitePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserInvitePage()),
    );
  }

  void MoveToDeviceDataPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DeviceDataPage()),
    );
  }
}
