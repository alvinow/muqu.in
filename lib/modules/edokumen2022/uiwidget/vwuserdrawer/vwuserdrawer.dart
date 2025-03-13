import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';



class VwUserDrawer extends StatelessWidget {
  VwUserDrawer({required this.appInstanceParam});

  final VwAppInstanceParam appInstanceParam;



  @override
  Widget build(BuildContext context) {
    Widget returnValue = Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SPI Mobile 2022",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ]),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text(
            'Logout',
            style: TextStyle(color: Colors.red),
          ),
          onTap: () {
          //do logout
           // this.parentBloc.add(LogoutPagecoordinatorEvent(timestamp: DateTime.now()));
          },
        ),
      ],
    ));
    return returnValue;
  }
}
