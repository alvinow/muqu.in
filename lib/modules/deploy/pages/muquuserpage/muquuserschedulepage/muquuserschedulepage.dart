import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/vwhometabitem/vwhometabitem.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';

class MuquUserSchedulePage extends StatefulWidget {


  MuquUserSchedulePage({
    required this.appInstanceParam
  });

  final VwAppInstanceParam appInstanceParam;

  static VwHomeTabItem createPageTabItem(
      {required VwAppInstanceParam appInstanceParam,double iconSize=25}) {
    return VwHomeTabItem(
        buttonSelected: BottomNavigationBarItem(
          icon: Icon(Icons.event_note,
              size: iconSize*1.2),
          label: 'Jadwal',
        ),
        buttonUnselected: BottomNavigationBarItem(
          icon: Icon(Icons.event_note_outlined,
              size: iconSize),
          label: 'Jadwal',
        ),
        tabPage:
        MuquUserSchedulePage(appInstanceParam: appInstanceParam)

    );
  }

  MuquUserSchedulePageState createState() => MuquUserSchedulePageState();
}

class MuquUserSchedulePageState extends State<MuquUserSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: this.widget.key, body: Text("User Schedule Page"));
  }
}
