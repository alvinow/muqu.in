import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  SocialMediaIcon(
      {required this.icon,
      required this.url,
      this.iconColor = Colors.white,
      this.backgroundColor = Colors.black});


  final IconData icon;
  final String url;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return this.url.length < 5
        ? Container()
        : Container(
            height: 35,
            color: this.backgroundColor,
            child: InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(this.url);
                  await launchUrl(url);
                },
                child: Icon(Icons.tiktok, color: this.iconColor)));
  }
}
