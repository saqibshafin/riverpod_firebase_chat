# riverpod_firebase_chat

It's a Chat app built on Flutter & Firebase, with Riverpod. Built in a Domain Driven, Feature First approach.

## Things not Done
- Almost everything. This app doesn't make any sense as of yet.
- Chat
- Notifications (BTW, I used it in my MedicalEmergency app)
- This README

## Things Done
- Login/Logout
- Reverse engineering (up to a point) of the behavior of this [Github repo of Andrea Bizzotto.](https://github.com/bizz84/starter_architecture_flutter_firebase)

## A Comprehensive Description
Building a Chat app, using Flutter as the frontend framework, and Firebase as the backend. Riverpod is used as the state-management library.

## Setup Instructions for running the project with Firebase

To use this project with Firebase, follow these steps:

- Create a new project with the Firebase console
- Enable Firebase Authentication, along with the Email/Password Authentication Sign-in provider in the Firebase Console (Authentication > Sign-in method > Email/Password > Edit > Enable > Save)
- Enable Cloud Firestore (And Watch out for the Security Rules!)
- Be watchful of creating Firestore Index, if you wanna see what I tried to do.

Then, follow one of the two approaches below. 👇

### 1. Using the CLI

Make sure you have the Firebase CLI and [FlutterFire CLI](https://pub.dev/packages/flutterfire_cli) installed.

Then run this on the terminal from the root of this project:

- Run `firebase login` so you have access to the Firebase project you have created
- Run `flutterfire configure` and follow all the steps

For more info, follow this guide, go to [Important Links](#important-links).

### 2. Manual way (not recommended)

If you don't want to use FlutterFire CLI, follow these steps instead:

- Register separate iOS, Android, and web apps in the Firebase project settings.
- On Android, use `com.shafin.riverpod_firebase_chat` as the package name.
- Then, [download and copy](https://firebase.google.com/docs/flutter/setup#configure_an_android_app) `google-services.json` into `android/app`.

## Important Links
1. https://firebase.google.com/docs/cli#mac-linux-auto-script
1. https://firebase.google.com/docs/flutter/setup?platform=android
1. https://firebase.google.com/docs/firestore/quickstart#dart