# 🚀 AppsFlyer SDK Sample App for Flutter 📱📱
This is a sample Flutter app that demonstrates the integration of the AppsFlyer SDK. The app is using version 6.9.3 of the SDK.
Sample app packageName is com.appsflyer.sdk.support.flutter.demo.af_flutter_sample_app

## 🎁 Features 🎉🎉

This sample app includes the following features:

### 📝 Basic Integration Instructions 📝

<div>
<img src="https://user-images.githubusercontent.com/118281047/219001706-65726595-6d6a-4ad4-96b7-d7ae305cd73c.png" width="300">
<img src="https://user-images.githubusercontent.com/118281047/219003098-557db622-65e9-47a4-b24c-ae2752b4cd7e.png" width="300">
</div>

When the application is first being launched, the SDK won't start yet as it is in deferred mode by default. 
This can be changed by switch the "Deferred Start" toggle and re-launch the application.
The default state is to use deferred start and use UDL instead of GCD for Deferred Deep Linking (and eventually also Direct deep linking).

### 🎯 In-App Events Testing 🎯

<div>
<img src="https://user-images.githubusercontent.com/118281047/219001718-350319a2-0cc9-4cdd-88e5-4c6ddf3c5ac4.png" width="300">
<img src="https://user-images.githubusercontent.com/118281047/219003102-fd5b98ee-7aee-448e-aaee-a35cbc6ab61b.png" width="300">
</div>

You can choose between 3 different scenarios:
<ul>
  <li> Regular In-App Event📊 </li>
  <li> Purchase In-App Event💰 </li>
  <li> Custom In-App Event📌 </li>
</ul>  

### 👥 User Invite Testing 👥

<div>
<img src="https://user-images.githubusercontent.com/118281047/219001724-6e3d4f99-e0d1-4e55-b93f-bea7a09a719c.png" width="300">
<img src="https://user-images.githubusercontent.com/118281047/219003106-4af06445-6471-4044-b892-c08ae3873911.png" width="300">
</div>

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
<div>
<img src="https://user-images.githubusercontent.com/118281047/219001713-265b9fb9-6899-4114-b410-b15da6e9d90a.png" width="300">
<img src="https://user-images.githubusercontent.com/118281047/219003093-0ad43210-16e4-416a-8018-e193566fe21e.png" width="300">
</div>

For each Platform you will have the following:
<ul>
  <li> Fetching GAID for Android 🤖 </li>
  <li> Fetching IDFA and IDFV for iOS 🍎 </li>
</ul>  
You have the ability to disableIdentifersCollection 🛡️



