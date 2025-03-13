import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/vwhometabitem/vwhometabitem.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';

class MuquUserPostPage extends StatefulWidget {


  MuquUserPostPage({
    required this.appInstanceParam
  });

  final VwAppInstanceParam appInstanceParam;

  static VwHomeTabItem createPageTabItem(
      {required VwAppInstanceParam appInstanceParam,double iconSize=25}) {
    return VwHomeTabItem(
        buttonSelected: BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,
              size: iconSize*1.2),
          label: 'Jadwal',
        ),
        buttonUnselected: BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline,
              size: iconSize),
          label: 'Jadwal',
        ),
        tabPage:
        MuquUserPostPage(appInstanceParam: appInstanceParam)

    );
  }

  MuquUserPostPageState createState() => MuquUserPostPageState();
}

class MuquUserPostPageState extends State<MuquUserPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: this.widget.key, body: Text("User Schedule Page"));
  }
}
