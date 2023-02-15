# 🚀 AppsFlyer SDK Sample App for Flutter 📱📱
This is a sample Flutter app that demonstrates the integration of the AppsFlyer SDK. The app is using version 6.9.3 of the SDK.
Sample app packageName is com.appsflyer.sdk.support.flutter.demo.af_flutter_sample_app

## 🎁 Features 🎉🎉

This sample app includes the following features:

### 📝 Basic Integration Instructions 📝
When the application is first being launched, the SDK won't start yet as it is in deferred mode by default. This can be changed by switch the "Deferred Start" toggle and re-launch the application.

The default state is to use deferred start and use UDL instead of GCD for Deferred Deep Linking (and eventually also Direct deep linking).
### 🎯 In-App Events Testing 🎯
You can choose between 3 different scenarios:
  - Regular In-App Event📊
  - Purchase In-App Event💰
  - Custom In-App Event📌
### 👥 User Invite Testing 👥
<img src="https://i.imgur.com/hxLzFwm.png" width="300">
You can now create generated short link via the User Invite feature.
Make sure to input the correct App Invite OneLink ID in the main screen before starting the SDK and you can override these fields:

1. Media Source (pid, default is af_app_invites)
2. Channel
3. Campaign
4. deep_link_value
5. deep_link_sub1
6. deep_link_sub2
7. deep_link_sub3
8. deep_link_sub4
9. deep_link_sub5
10. deep_link_sub6
11. deep_link_sub7
12. deep_link_sub8
13. deep_link_sub9
14. deep_link_sub10

### 📱 Device Data 📱
<img src="https://i.imgur.com/fETtbTx.png" width="300">
  - Fetching GAID for Android 🤖
  - Fetching IDFA and IDFV for iOS 🍎
You have the ability to disableIdentifersCollection 🛡️
