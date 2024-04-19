How to run our app on an Android device:

1. On your Android device, open Settings>Install unknown apps>Drive and make sure 
    “Allow from this source” is  enabled
2. Open [this Google Drive folder](https://drive.google.com/drive/folders/1-1AugYlaHy1GCWwW7ILnbnNv5WbCzrj6?usp=sharing) on your Android device 
3. Download the file called AtomicHabits.apk
4. Locate the file in your device’s file system and click on it
5. You should be asked if you would like to install the app. Click install.
6. After it finishes installing, the app will appear on your home screen and you’re 
    ready to begin building new habits!


How to fully build & run project on IOS Simulator:

1. Install Flutter
2. Open IOS Simulator
3. Navigate to home-directory (src-code folder)
4. flutter clean 
5. flutter pub get
6. cd ios
7. pod deintegrate
8. pod update Firebase/Auth
9. pod install --repo-update
10. cd ..
11. flutter run

The platforms were developed in VSCode, run on flutter/dart, and can be run on IOS or Android. 
