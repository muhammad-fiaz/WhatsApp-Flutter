// Importing necessary packages and modules
import 'package:cached_network_image/cached_network_image.dart';
import 'package:whatsapp/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'WAppColors.dart';

// Function to create a box decoration with the given parameters
BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color? bgColor, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? Colors.white,
    boxShadow: showShadow ? defaultBoxShadow(shadowColor: shadowColorGlobal) : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

// Function to create an app bar with the given parameters
Widget appBar(BuildContext context, String title, {PreferredSizeWidget? bottom, List<Widget>? actions, bool showBack = true, Color? color, Color? iconColor, Color? textColor}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: color ?? appStore.appBarColor,
    leading: showBack
        ? IconButton(
      onPressed: () {
        finish(context);
      },
      icon: Icon(Icons.arrow_back, color: iconColor),
    )
        : null,
    title: appBarTitleWidget(context, title, color: color, textColor: textColor),
    actions: actions,
    bottom: bottom,
  );
}

// Function to create a title widget for the app bar with the given parameters
Widget appBarTitleWidget(context, String title, {Color? color, Color? textColor}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    color: color ?? appStore.appBarColor,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: boldTextStyle(color: textColor ?? appStore.textPrimaryColor, size: 20),
            maxLines: 1,
          ),
        ),
      ],
    ),
  );
}

// Function to return a placeholder widget
Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

// Function to return a placeholder image
Widget placeholderWidget() => Image.asset('images/playStore/placeholder.jpg', fit: BoxFit.cover);

// Function to create a widget for a cached network image with the given parameters
Widget commonCacheImageWidget(String? url, {double? width, BoxFit? fit, double? height}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit);
    }
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit);
  }
}

// Function to create a setting item widget with the given parameters
Widget settingItem(context, String text, {Function? onTap, Widget? detail, Widget? leading, Color? textColor, int? textSize, double? padding}) {
  return InkWell(
    onTap: onTap as void Function()?,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: padding ?? 8, bottom: padding ?? 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(width: 30, alignment: Alignment.center, child: leading ?? const SizedBox()),
              leading != null ? 10.width : const SizedBox(),
              Text(text, style: primaryTextStyle(size: textSize ?? 16, color: appTextColorPrimary)).expand(),
            ],
          ).expand(),
          detail ?? const Icon(Icons.arrow_forward_ios, size: 16, color: appTextColorSecondary),
        ],
      ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
    ),
  );
}

// Class to create a custom theme for the application
class CustomTheme extends StatelessWidget {
  final Widget child;

  const CustomTheme({super.key, required this.child});

  // Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appStore.isDarkModeOn
          ? ThemeData.dark().copyWith(
        hintColor: Colors.blue,
        backgroundColor: appStore.scaffoldBackground,
      )

          : ThemeData.light(),
      child: child,
    );
  }
}