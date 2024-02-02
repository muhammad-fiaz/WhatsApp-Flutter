import 'package:whatsapp/main.dart';
import 'package:whatsapp/utils/WColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Widget cGAppBar(BuildContext context, {List<Widget>? actions, bool showBack = true, Color? color, Color iconColor = white}) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: false,
    backgroundColor: color ?? appStore.appBarColor,
    title: Text(
      'WhatsApp',
      style: boldTextStyle(size: 22, weight: FontWeight.w900, color: Colors.white),
    ),
    actions: actions,
  );
}

class SettingWidget extends StatefulWidget {
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final Function? onTap;
  final padding;
  const SettingWidget({super.key, this.icon, this.title, this.subtitle, this.onTap, this.padding});

  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return (widget.subtitle == null)
        ? ListTile(
            contentPadding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            leading: widget.icon != null ? Container(padding: const EdgeInsets.all(8.0), child: Icon(widget.icon, color: getColorFromHex('#075E54'))) : null,
            title: Text(widget.title!, style: primaryTextStyle(weight: FontWeight.w500)),
            onTap: widget.onTap as void Function()?,
          )
        : ListTile(
            contentPadding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            leading: widget.icon != null ? Container(padding: const EdgeInsets.all(8.0), child: Icon(widget.icon, color: getColorFromHex('#075E54'))) : null,
            title: Text(widget.title.validate(), style: primaryTextStyle(weight: FontWeight.w500, color: Colors.black)),
            subtitle: Text(widget.subtitle.validate()),
            onTap: widget.onTap as void Function()?,
          );
  }
}

class SettingItemHeader extends StatefulWidget {
  final String? title;
  final String? subtitle;

  final padding;

  const SettingItemHeader({super.key, this.title, this.subtitle, this.padding});

  @override
  _SettingItemHeaderState createState() => _SettingItemHeaderState();
}

class _SettingItemHeaderState extends State<SettingItemHeader> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.subtitle != null) {
      return ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(widget.title!, style: boldTextStyle(size: 14, color: secondaryColor)),
        ),
        subtitle: widget.subtitle == null ? null : Text(widget.subtitle!),
        contentPadding: widget.padding,
      );
    }
    return Padding(
      padding: widget.padding,
      child: Text(
        widget.title!,
        style: boldTextStyle(size: 14, color: secondaryColor),
      ),
    );
  }
}

Widget commonAppBar(BuildContext context, {String? title}) {
  return AppBar(
    backgroundColor: secondaryColor,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        finish(context);
      },
    ),
    title: Text(
      title.validate(),
      style: boldTextStyle(color: textPrimaryColors, size: 22),
    ),
  );
}
