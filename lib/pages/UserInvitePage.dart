import 'package:af_flutter_sample_app/AFManager.dart';
import 'package:af_flutter_sample_app/app_constants.dart';
import 'package:af_flutter_sample_app/widgets_utils/Header.dart';
import 'package:af_flutter_sample_app/widgets_utils/MyCustomButton.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserInvitePage extends StatefulWidget {
  const UserInvitePage({Key? key}) : super(key: key);

  @override
  State<UserInvitePage> createState() => _UserInvitePageState();
}

class _UserInvitePageState extends State<UserInvitePage> {
  var appsflyerSdk = AFManager().appsflyerSdk;
  final linkController = TextEditingController();
  final pidController = TextEditingController();
  final channelController = TextEditingController();
  final campaignController = TextEditingController();
  final deepLinkValueController = TextEditingController();
  final deepLinkSub1Controller = TextEditingController();
  final deepLinkSub2Controller = TextEditingController();
  final deepLinkSub3Controller = TextEditingController();
  final deepLinkSub4Controller = TextEditingController();
  final deepLinkSub5Controller = TextEditingController();
  final deepLinkSub6Controller = TextEditingController();
  final deepLinkSub7Controller = TextEditingController();
  final deepLinkSub8Controller = TextEditingController();
  final deepLinkSub9Controller = TextEditingController();
  final deepLinkSub10Controller = TextEditingController();

  @override
  void dispose() {
    linkController.dispose();
    pidController.dispose();
    channelController.dispose();
    campaignController.dispose();
    deepLinkValueController.dispose();
    deepLinkSub1Controller.dispose();
    deepLinkSub2Controller.dispose();
    deepLinkSub3Controller.dispose();
    deepLinkSub4Controller.dispose();
    deepLinkSub5Controller.dispose();
    deepLinkSub6Controller.dispose();
    deepLinkSub7Controller.dispose();
    deepLinkSub8Controller.dispose();
    deepLinkSub9Controller.dispose();
    deepLinkSub10Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Header(headerText: AppConstants.LABEL_USER_INVITE_PAGE),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Data with clipboard functionality',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.content_copy),
                    onPressed: () {
                      copyLinkToClipboard(context);
                    },
                  ),
                ),
                controller: linkController,
                readOnly: true,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_PID,
                        ),
                        controller: pidController,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_CHANNEL,
                        ),
                        controller: channelController,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_CAMPAIGN,
                        ),
                        controller: campaignController,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_VALUE,
                        ),
                        controller: deepLinkValueController,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_SUB1,
                        ),
                        controller: deepLinkSub1Controller,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_SUB2,
                        ),
                        controller: deepLinkSub2Controller,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_SUB3,
                        ),
                        controller: deepLinkSub3Controller,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_SUB4,
                        ),
                        controller: deepLinkSub4Controller,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_SUB5,
                        ),
                        controller: deepLinkSub5Controller,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_SUB6,
                        ),
                        controller: deepLinkSub6Controller,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_SUB7,
                        ),
                        controller: deepLinkSub7Controller,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_SUB8,
                        ),
                        controller: deepLinkSub8Controller,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_SUB9,
                        ),
                        controller: deepLinkSub9Controller,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: AppConstants.HINT_DEEP_LINK_SUB10,
                        ),
                        controller: deepLinkSub10Controller,
                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MyCustomButton(
                  onPressed: generateLink, buttonText: "Generate Link"),
            )
          ],
        ),
      ),
    );
  }

  void copyLinkToClipboard(BuildContext context) {
    if (linkController.text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: linkController.text));
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Copied to your clipboard !')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Link is empty!')));
    }
  }

  //TODO Fix
  void generateLink() {
    var customParams = checkAndAssignValues();
    String channel = channelController.text.isEmpty
        ? "default_channel"
        : channelController.text;
    String campaign = campaignController.text.isEmpty
        ? "default_campaign"
        : campaignController.text;

    AppsFlyerInviteLinkParams inviteLinkParams = AppsFlyerInviteLinkParams(
        channel: channel, campaign: campaign, customParams: customParams);

    appsflyerSdk.generateInviteLink(inviteLinkParams, (result) {
      print(result);
      setState(() {
        linkController.text = result["payload"]["userInviteURL"];
      });
    }, (error) {
      print(error);
    });
  }

  Map<String, String> checkAndAssignValues() {
    String pid =
        pidController.text.isEmpty ? "default_pid" : pidController.text;
    String deepLinkValue = deepLinkValueController.text.isEmpty
        ? "default_deep_link_value"
        : deepLinkValueController.text;
    String deepLinkSub1 = deepLinkSub1Controller.text.isEmpty
        ? "default_sub_1"
        : deepLinkSub1Controller.text;
    String deepLinkSub2 = deepLinkSub2Controller.text.isEmpty
        ? "default_sub_2"
        : deepLinkSub2Controller.text;
    String deepLinkSub3 = deepLinkSub3Controller.text.isEmpty
        ? "default_sub_3"
        : deepLinkSub3Controller.text;
    String deepLinkSub4 = deepLinkSub4Controller.text.isEmpty
        ? "default_sub_4"
        : deepLinkSub4Controller.text;
    String deepLinkSub5 = deepLinkSub5Controller.text.isEmpty
        ? "default_sub_5"
        : deepLinkSub5Controller.text;
    String deepLinkSub6 = deepLinkSub6Controller.text.isEmpty
        ? "default_sub_6"
        : deepLinkSub6Controller.text;
    String deepLinkSub7 = deepLinkSub7Controller.text.isEmpty
        ? "default_sub_7"
        : deepLinkSub7Controller.text;
    String deepLinkSub8 = deepLinkSub8Controller.text.isEmpty
        ? "default_sub_8"
        : deepLinkSub8Controller.text;
    String deepLinkSub9 = deepLinkSub9Controller.text.isEmpty
        ? "default_sub_9"
        : deepLinkSub9Controller.text;
    String deepLinkSub10 = deepLinkSub10Controller.text.isEmpty
        ? "default_sub_10"
        : deepLinkSub10Controller.text;

    Map<String, String> values = {
      "pid": pid,
      "deep_link_value": deepLinkValue,
      "deep_link_sub_1": deepLinkSub1,
      "deep_link_sub_2": deepLinkSub2,
      "deep_link_sub_3": deepLinkSub3,
      "deep_link_sub_4": deepLinkSub4,
      "deep_link_sub_5": deepLinkSub5,
      "deep_link_sub_6": deepLinkSub6,
      "deep_link_sub_7": deepLinkSub7,
      "deep_link_sub_8": deepLinkSub8,
      "deep_link_sub_9": deepLinkSub9,
      "deep_link_sub_10": deepLinkSub10,
    };

    return values;
  }
}
