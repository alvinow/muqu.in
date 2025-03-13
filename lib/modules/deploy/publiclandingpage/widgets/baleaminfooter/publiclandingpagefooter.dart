import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matrixclient/deployappconfig.dart';
import 'package:matrixclient/modules/deploy/publiclandingpage/widgets/libs/socialmediaicon/socialmediaicon.dart';
import 'package:matrixclient2base/appconfig.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicLandingPageFooter extends StatelessWidget {
  PublicLandingPageFooter(
      {required this.baseAppConfig, this.backgroundColor = Colors.white, this.textColor = Colors.black});

  final Color backgroundColor;
  final Color textColor;
  final BaseAppConfig baseAppConfig;

  @override
  Widget build(BuildContext context) {
    Widget returnValue = Container();

    Widget titokIconLink = SocialMediaIcon(
      icon: Icons.tiktok,
      url: this.baseAppConfig.socialMediaUrl.tiktok,
      iconColor: this.baseAppConfig.baseThemeConfig.textColor,
      backgroundColor: this.baseAppConfig.baseThemeConfig.primaryColor,
    );

    Widget youtubeIconLink = this.baseAppConfig.socialMediaUrl.youtube.length < 5
        ? Container()
        : Container(
            height: 35,
            child: InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(this.baseAppConfig.socialMediaUrl.youtube);

                  await launchUrl(url);
                },
                child: Icon(FontAwesomeIcons.youtube, color: Colors.white)));

    Widget instagramIconLink = this.baseAppConfig.socialMediaUrl.instagram.length < 5
        ? Container()
        : Container(
            height: 35,
            child: InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(this.baseAppConfig.socialMediaUrl.instagram);

                  await launchUrl(url);
                },
                child: Icon(FontAwesomeIcons.instagram, color: Colors.white)));

    Widget socialMediaIconLink = FadeIn(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOutBack,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            instagramIconLink,
            SizedBox(
              width: 5,
            ),
            titokIconLink,
            SizedBox(
              width: 5,
            ),
            youtubeIconLink,
          ],
        ));

    returnValue = Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
            height: 35,
            color: this.baseAppConfig.baseThemeConfig.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      this.baseAppConfig.generalConfig.copyrightText,
                      style: TextStyle(color: Colors.white, fontSize: 9),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                    child: socialMediaIconLink),
              ],
            )));

    return returnValue;
  }
}
