/*
MIT License

Copyright (c) 2024 Muhammad Fiaz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

 */

// Importing necessary packages and modules
import 'package:camera/camera.dart';
import 'package:whatsapp/screens/WSplashScreen.dart';
import 'package:whatsapp/store/WAppStore.dart';
import 'package:whatsapp/utils/WAppTheme.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

// Global instance of the AppStore
AppStore appStore = AppStore();

// Global variable to set the wallpaper
int setWallpaper = 0;
// Global list to hold the camera descriptions
late List<CameraDescription> cameras;

// Main function of the application
void main() async {
  // Ensuring that all the widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Performing some initial setup
  await initialize();
  // Toggling the dark mode based on the user's preference
  appStore.toggleDarkMode(value: await getBool(isDarkModeOnPref, defaultValue: false));
  // Running the application
  runApp(MyApp());
}

// This widget is the root of the application.
class MyApp extends StatelessWidget {
  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          // Setting the title of the application
          title: 'WhatsApp flutter',
          // Setting the theme of the application based on the user's preference
          theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
          // Setting the scroll behaviour of the application
          builder: scrollBehaviour(),
          // Disabling the debug banner
          debugShowCheckedModeBanner: false,
          // Setting the home screen of the application
          home: CGSplashScreen(),
        );
      },
    );
  }
}