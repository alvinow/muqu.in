import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/vwhometabitem/vwhometabitem.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwform/modules/vwwidget/userinfopage/main.dart';

class MuquCurrentUserProfilePage extends StatefulWidget {


  MuquCurrentUserProfilePage({
    required this.appInstanceParam
  });

  final VwAppInstanceParam appInstanceParam;

  static VwHomeTabItem createPageTabItem(
      {required VwAppInstanceParam appInstanceParam,double iconSize=25}) {
    return VwHomeTabItem(
        buttonSelected: BottomNavigationBarItem(
          icon: Icon(Icons.person,
              size: iconSize*1.2),
          label: 'Account',
        ),
        buttonUnselected: BottomNavigationBarItem(
          icon: Icon(Icons.person_pin,
              size: iconSize),
          label: 'Account',
        ),
        tabPage:
        MuquCurrentUserProfilePage(appInstanceParam: appInstanceParam)

    );
  }
  MuquCurrentUserProfilePageState createState() => MuquCurrentUserProfilePageState();
}

class MuquCurrentUserProfilePageState extends State<MuquCurrentUserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return UserInfoPage(appInstanceParam: widget.appInstanceParam,showClosePageButton: false,);
  }
}
