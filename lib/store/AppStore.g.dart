// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WAppStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

// This mixin is used to add functionality to the AppStoreBase class.
mixin _$AppStore on AppStoreBase, Store {
  // Atom to hold the state of the dark mode toggle
  final _$isDarkModeOnAtom = Atom(name: 'AppStoreBase.isDarkModeOn');

  // Getter for the dark mode state
  @override
  bool get isDarkModeOn {
    _$isDarkModeOnAtom.reportRead();
    return super.isDarkModeOn;
  }

  // Setter for the dark mode state
  @override
  set isDarkModeOn(bool value) {
    _$isDarkModeOnAtom.reportWrite(value, super.isDarkModeOn, () {
      super.isDarkModeOn = value;
    });
  }

  // Atom to hold the state of the scaffold background color
  final _$scaffoldBackgroundAtom =
  Atom(name: 'AppStoreBase.scaffoldBackground');

  // Getter for the scaffold background color
  @override
  Color? get scaffoldBackground {
    _$scaffoldBackgroundAtom.reportRead();
    return super.scaffoldBackground;
  }

  // Setter for the scaffold background color
  @override
  set scaffoldBackground(Color? value) {
    _$scaffoldBackgroundAtom.reportWrite(value, super.scaffoldBackground, () {
      super.scaffoldBackground = value;
    });
  }

  // Atom to hold the state of the background color
  final _$backgroundColorAtom = Atom(name: 'AppStoreBase.backgroundColor');

  // Getter for the background color
  @override
  Color? get backgroundColor {
    _$backgroundColorAtom.reportRead();
    return super.backgroundColor;
  }

  // Setter for the background color
  @override
  set backgroundColor(Color? value) {
    _$backgroundColorAtom.reportWrite(value, super.backgroundColor, () {
      super.backgroundColor = value;
    });
  }

  // Atom to hold the state of the secondary background color
  final _$backgroundSecondaryColorAtom =
  Atom(name: 'AppStoreBase.backgroundSecondaryColor');

  // Getter for the secondary background color
  @override
  Color? get backgroundSecondaryColor {
    _$backgroundSecondaryColorAtom.reportRead();
    return super.backgroundSecondaryColor;
  }

  // Setter for the secondary background color
  @override
  set backgroundSecondaryColor(Color? value) {
    _$backgroundSecondaryColorAtom
        .reportWrite(value, super.backgroundSecondaryColor, () {
      super.backgroundSecondaryColor = value;
    });
  }

  // Atom to hold the state of the primary text color
  final _$textPrimaryColorAtom = Atom(name: 'AppStoreBase.textPrimaryColor');

  // Getter for the primary text color
  @override
  Color? get textPrimaryColor {
    _$textPrimaryColorAtom.reportRead();
    return super.textPrimaryColor;
  }

  // Setter for the primary text color
  @override
  set textPrimaryColor(Color? value) {
    _$textPrimaryColorAtom.reportWrite(value, super.textPrimaryColor, () {
      super.textPrimaryColor = value;
    });
  }

  // Atom to hold the state of the primary light color
  final _$appColorPrimaryLightColorAtom =
  Atom(name: 'AppStoreBase.appColorPrimaryLightColor');

  // Getter for the primary light color
  @override
  Color? get appColorPrimaryLightColor {
    _$appColorPrimaryLightColorAtom.reportRead();
    return super.appColorPrimaryLightColor;
  }

  // Setter for the primary light color
  @override
  set appColorPrimaryLightColor(Color? value) {
    _$appColorPrimaryLightColorAtom
        .reportWrite(value, super.appColorPrimaryLightColor, () {
      super.appColorPrimaryLightColor = value;
    });
  }

  // Atom to hold the state of the secondary text color
  final _$textSecondaryColorAtom =
  Atom(name: 'AppStoreBase.textSecondaryColor');

  // Getter for the secondary text color
  @override
  Color? get textSecondaryColor {
    _$textSecondaryColorAtom.reportRead();
    return super.textSecondaryColor;
  }

  // Setter for the secondary text color
  @override
  set textSecondaryColor(Color? value) {
    _$textSecondaryColorAtom.reportWrite(value, super.textSecondaryColor, () {
      super.textSecondaryColor = value;
    });
  }

  // Atom to hold the state of the app bar color
  final _$appBarColorAtom = Atom(name: 'AppStoreBase.appBarColor');

  // Getter for the app bar color
  @override
  Color? get appBarColor {
    _$appBarColorAtom.reportRead();
    return super.appBarColor;
  }

  // Setter for the app bar color
  @override
  set appBarColor(Color? value) {
    _$appBarColorAtom.reportWrite(value, super.appBarColor, () {
      super.appBarColor = value;
    });
  }

  // Atom to hold the state of the icon color
  final _$iconColorAtom = Atom(name: 'AppStoreBase.iconColor');

  // Getter for the icon color
  @override
  Color? get iconColor {
    _$iconColorAtom.reportRead();
    return super.iconColor;
  }

  // Setter for the icon color
  @override
  set iconColor(Color? value) {
    _$iconColorAtom.reportWrite(value, super.iconColor, () {
      super.iconColor = value;
    });
  }

  // Atom to hold the state of the secondary icon color
  final _$iconSecondaryColorAtom =
  Atom(name: 'AppStoreBase.iconSecondaryColor');

  // Getter for the secondary icon color
  @override
  Color? get iconSecondaryColor {
    _$iconSecondaryColorAtom.reportRead();
    return super.iconSecondaryColor;
  }

  // Setter for the secondary icon color
  @override
  set iconSecondaryColor(Color? value) {
    _$iconSecondaryColorAtom.reportWrite(value, super.iconSecondaryColor, () {
      super.iconSecondaryColor = value;
    });
  }

  // Atom to hold the state of the selected language
  final _$selectedLanguageAtom = Atom(name: 'AppStoreBase.selectedLanguage');

  // Getter for the selected language
  @override
  String get selectedLanguage {
    _$selectedLanguageAtom.reportRead();
    return super.selectedLanguage;
  }

  // Setter for the selected language
  @override
  set selectedLanguage(String value) {
    _$selectedLanguageAtom.reportWrite(value, super.selectedLanguage, () {
      super.selectedLanguage = value;
    });
  }

  // Atom to hold the state of the selected drawer item
  final _$selectedDrawerItemAtom =
  Atom(name: 'AppStoreBase.selectedDrawerItem');

  // Getter for the selected drawer item
  @override
  int get selectedDrawerItem {
    _$selectedDrawerItemAtom.reportRead();
    return super.selectedDrawerItem;
  }

  // Setter for the selected drawer item
  @override
  set selectedDrawerItem(int value) {
    _$selectedDrawerItemAtom.reportWrite(value, super.selectedDrawerItem, () {
      super.selectedDrawerItem = value;
    });
  }

  // Async action to toggle the dark mode
  final _$toggleDarkModeAsyncAction =
  AsyncAction('AppStoreBase.toggleDarkMode');

  // Function to toggle the dark mode
  @override
  Future<void> toggleDarkMode({bool? value}) {
    return _$toggleDarkModeAsyncAction
        .run(() => super.toggleDarkMode(value: value));
  }

  // Action controller for the AppStoreBase class
  final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase');

  // Function to set the language
  @override
  void setLanguage(String aLanguage) {
    final $actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setLanguage');
    try {
      return super.setLanguage(aLanguage);
    } finally {
      _$AppStoreBaseActionController.endAction($actionInfo);
    }
  }

  // Function to set the drawer item index
  @override
  void setDrawerItemIndex(int aIndex) {
    final $actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setDrawerItemIndex');
    try {
      return super.setDrawerItemIndex(aIndex);
    } finally {
      _$AppStoreBaseActionController.endAction($actionInfo);
    }
  }

  // Function to convert the state of the store to a string
  @override
  String toString() {
    return '''
isDarkModeOn: ${isDarkModeOn},
scaffoldBackground: ${scaffoldBackground},
backgroundColor: ${backgroundColor},
backgroundSecondaryColor: ${backgroundSecondaryColor},
textPrimaryColor: ${textPrimaryColor},
appColorPrimaryLightColor: ${appColorPrimaryLightColor},
textSecondaryColor: ${textSecondaryColor},
appBarColor: ${appBarColor},
iconColor: ${iconColor},
iconSecondaryColor: ${iconSecondaryColor},
selectedLanguage: ${selectedLanguage},
selectedDrawerItem: ${selectedDrawerItem}
    ''';
  }
}