import 'package:whatsapp/utils/WAppColors.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

part 'AppStore.g.dart';

// The AppStore class extends the AppStoreBase class and mixes in the _$AppStore class
class AppStore = AppStoreBase with _$AppStore;

// The AppStoreBase class is an abstract class that uses MobX observables and actions to manage the state of the application
abstract class AppStoreBase with Store {
  // Observable that tracks whether dark mode is enabled
  @observable
  bool isDarkModeOn = false;

  // Observable that tracks the background color of the scaffold
  @observable
  Color? scaffoldBackground;

  // Observable that tracks the background color
  @observable
  Color? backgroundColor;

  // Observable that tracks the secondary background color
  @observable
  Color? backgroundSecondaryColor;

  // Observable that tracks the primary text color
  @observable
  Color? textPrimaryColor;

  // Observable that tracks the light primary color of the app
  @observable
  Color? appColorPrimaryLightColor;

  // Observable that tracks the secondary text color
  @observable
  Color? textSecondaryColor;

  // Observable that tracks the color of the app bar
  @observable
  Color? appBarColor;

  // Observable that tracks the color of icons
  @observable
  Color? iconColor;

  // Observable that tracks the secondary color of icons
  @observable
  Color? iconSecondaryColor;

  // Observable that tracks the selected language
  @observable
  String selectedLanguage = 'en';

  // Observable that tracks the selected item in the drawer
  @observable
  var selectedDrawerItem = -1;

  // Action that toggles dark mode on and off
  @action
  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value ?? !isDarkModeOn;

    if (isDarkModeOn) {
      scaffoldBackground = appBackgroundColorDark;

      appBarColor = cardBackgroundBlackDark;
      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white;
      appColorPrimaryLightColor = cardBackgroundBlackDark;

      iconColor = iconColorPrimary;
      iconSecondaryColor = iconColorSecondary;

      textPrimaryColor = whiteColor;
      textSecondaryColor = Colors.white54;

      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;
      shadowColorGlobal = appShadowColorDark;
    } else {
      scaffoldBackground = Colors.white;

      appBarColor = Colors.white;
      backgroundColor = Colors.black;
      backgroundSecondaryColor = appSecondaryBackgroundColor;
      appColorPrimaryLightColor = appColorPrimaryLight;

      iconColor = iconColorPrimaryDark;
      iconSecondaryColor = iconColorSecondaryDark;

      textPrimaryColor = appTextColorPrimary;
      textSecondaryColor = appTextColorSecondary;

      textPrimaryColorGlobal = appTextColorPrimary;
      textSecondaryColorGlobal = appTextColorSecondary;
      shadowColorGlobal = appShadowColor;
    }

    await setBool(isDarkModeOnPref, isDarkModeOn);
  }

  // Action that sets the selected language
  @action
  void setLanguage(String aLanguage) => selectedLanguage = aLanguage;

  // Action that sets the selected drawer item index
  @action
  void setDrawerItemIndex(int aIndex) {
    selectedDrawerItem = aIndex;
  }
}