import 'package:whatsapp/utils/WColors.dart';
import 'package:whatsapp/utils/WConstant.dart';
import 'package:whatsapp/utils/WWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CGEditProfileScreen extends StatefulWidget {
  @override
  _CGEditProfileScreenState createState() => _CGEditProfileScreenState();
}

class _CGEditProfileScreenState extends State<CGEditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: "Profile") as PreferredSizeWidget?,
        body: Container(padding: const EdgeInsets.all(32.0), child: Column(children: [_buildProfileImage(), 32.height, _buildProfileDetails()])),
      ),
    );
  }

  _buildProfileImage() {
    return Stack(children: [
      const Hero(
        tag: "profile_image",
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/65.jpg"),
          radius: 80.0,
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(60.0)),
          child: const Icon(Icons.camera_alt_rounded, color: Colors.white),
        ),
      )
    ]).center();
  }

  _buildProfileDetails() {
    return const Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          trailing: Icon(Icons.create, color: Colors.grey),
          leading: Icon(Icons.person, color: secondaryColor),
          title: Text("Name", style: TextStyle(color: Colors.grey)),
          subtitle: Text("John Smith", style: TextStyle(color: Colors.black, fontSize: 18.0)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 55.0),
          child: Text("This is not your username or pin. this name will be visible to your $CGAppName contact.", style: TextStyle(color: Colors.grey)),
        ),
        Divider(thickness: 1, indent: 55.0),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.error_outline, color: secondaryColor),
          trailing: Icon(Icons.create, color: Colors.grey),
          title: Text("About", style: TextStyle(color: Colors.grey)),
          subtitle: Text("I am flutter developer", style: TextStyle(color: Colors.black, fontSize: 18.0)),
        ),
        Divider(thickness: 1, indent: 55.0),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.call, color: secondaryColor),
          title: Text("Phone", style: TextStyle(color: Colors.grey)),
          subtitle: Text("+91 123456 6789", style: TextStyle(color: Colors.black, fontSize: 18.0)),
        ),
      ],
    );
  }
}
