import 'package:flutter/cupertino.dart';

class AppConstants {
  //Start Region: HomePage Page Constants
  //static const String DEV_KEY = "mkYxfjQyGL4iDYUSxkHua5";
  static const String DEV_KEY = "DfEfyjRiRwSykUeJEaiAuB";
  static const String APP_ID = "206841498";
  static const String LOGO_PATH = "assets/logo.png";
  static const String DESC_DEFAULT =
      "The SDK is not initialized and not started";
  static const String DESC_INIT = "The SDK is initialized but not started";
  static const String DESC_INIT_START = "The SDK is initialized and started";
  static const String DESC_STOP = "The SDK stopped";
  static const String DEFERRED_START = "Deferred Start";
  static const String USE_UDL = "Use UDL (Instead of GCD)";
  static const String USE_APP_CONTEXT = "Use Application Context";
  static const String USE_WAIT_CUID = "Use waitForCUID (Deferred Start)";
  static const String USE_ANONYMIZE_USER = "Use anonymizeUser";
  static const String HINT_APP_INVITE = "App Invite onelink ID";
  static const String HINT_WAIT_FOR_ATT = "Wait for ATT (in seconds)";
  static const String HINT_UDL_TIMEOUT = "UDL Timeout (In Seconds)";
  static const String HINT_CUID = "CUID";
  static const String HINT_HOST = "Host";
  static const String HINT_HOST_PREFIX = "Host Prefix";
  static const EdgeInsets EDGE_INSETS_TEXT_FIELD = EdgeInsets.all(10.0);
  static const String BTN_MORE_ACTIONS = "More Actions";
  static const String BTN_START = "Start SDK";
  static const String BTN_STOP = "Stop SDK";
  static const int START_SDK = 1;
  static const int STOP_SDK = 0;
  static const int DEFAULT = -1;
  //End Region: HomePage Constants
  //Start Region: MoreActionsPage Constants
  static const String LABEL_MORE_ACTIONS_PAGE = "More Actions Page";
  static const String BTN_IAE = "In App Events";
  static const String BTN_USER_INVITE = "User Invite";
  static const String BTN_DEVICE_DATA = "Device Data";
  //End Region: MoreActionsPage Constants
  //Start Region: IAEPage Constants
  static const String LABEL_IAE_PAGE = "In-App Events Page";
  static const String BTN_REG_IAE = "Regular In-App Event";
  static const String BTN_PURCHASE_IAE = "Purchase In-App Event";
  static const String BTN_CUSTOM_IAE = "Custom In-App Event";
  static const String HINT_EVENT_NAME = "Event Name";
  static const String HINT_EVENT_JSON = "Event Param JSON";
  static const String JSON_EXAMPLE =
      "{\"name\"\: \"Morpheush\",\"job\"\: \"\Leader\",\"id\": \"199\",\"createdAt\": \"2020-02-20T11:00:28.107Z\"}";
  //End Region: IAEPage Constants
  //Start Region: UserInvitePage Constants
  static const String LABEL_USER_INVITE_PAGE = "User Invite Page";
  static const String HINT_PID = "PID";
  static const String HINT_CHANNEL = "Channel";
  static const String HINT_CAMPAIGN = "Campaign";
  static const String HINT_DEEP_LINK_VALUE = "deep_link_value";
  static const String HINT_DEEP_LINK_SUB1 = "deep_link_sub1";
  static const String HINT_DEEP_LINK_SUB2 = "deep_link_sub2";
  static const String HINT_DEEP_LINK_SUB3 = "deep_link_sub3";
  static const String HINT_DEEP_LINK_SUB4 = "deep_link_sub4";
  static const String HINT_DEEP_LINK_SUB5 = "deep_link_sub5";
  static const String HINT_DEEP_LINK_SUB6 = "deep_link_sub6";
  static const String HINT_DEEP_LINK_SUB7 = "deep_link_sub7";
  static const String HINT_DEEP_LINK_SUB8 = "deep_link_sub8";
  static const String HINT_DEEP_LINK_SUB9 = "deep_link_sub9";
  static const String HINT_DEEP_LINK_SUB10 = "deep_link_sub10";
  //End Region: UserInvitePage Constants
  //Start Region: DeviceDataPage Constants
  static const String LABEL_DEVICE_DATA_PAGE = "Device Data Page";
  static const String LABEL_IDFV = "IDFV";
  static const String LABEL_IDFA = "IDFA";
  static const String BTN_DISABLE_IDFA = "Disable IDFA Collection";
  static const String BTN_DISABLE_GAID = "Disable GAID Collection";
  static const String BTN_DISABLE_IDFV = "Disable IDFV Collection";
  static const String LABEL_GAID = "GAID";
  static const String LABEL_OAID = "OAID";
}
