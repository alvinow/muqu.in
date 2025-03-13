import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/vwhometabitem/vwhometabitem.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';

class MuquUserSearchPage extends StatefulWidget {


  MuquUserSearchPage({
    required this.appInstanceParam
  });

  final VwAppInstanceParam appInstanceParam;

  static VwHomeTabItem createPageTabItem(
      {required VwAppInstanceParam appInstanceParam,double iconSize=25}) {
    return VwHomeTabItem(
        buttonSelected: BottomNavigationBarItem(
          icon: Icon(Icons.search,
              size: iconSize*1.2),
          label: 'Search',
        ),
        buttonUnselected: BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined,
              size: iconSize),
          label: 'Search',
        ),
        tabPage:
        MuquUserSearchPage(appInstanceParam: appInstanceParam)

    );
  }

  MuquUserSearchPageState createState() => MuquUserSearchPageState();
}

class MuquUserSearchPageState extends State<MuquUserSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: this.widget.key, body: Text("User Search Page"));
  }
}
