import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/vwhomepagebase/vwhomepagebase.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/vwhomepageoperatorticket/vwhomepageoperatorticket.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/vwhometabitem/vwhometabitem.dart';
import 'package:matrixclient/modules/deploy/pages/muquuserpage/muqucurrentuserprofilepage/muqucurrentuserprofilepage.dart';
import 'package:matrixclient/modules/deploy/pages/muquuserpage/muquuserfeedpage/muquuserfeedpage.dart';
import 'package:matrixclient/modules/deploy/pages/muquuserpage/muquuserpostpage/muquuserpostpage.dart';
import 'package:matrixclient/modules/deploy/pages/muquuserpage/muquuserschedulepage/muquuserschedulepage.dart';
import 'package:matrixclient/modules/deploy/pages/muquuserpage/muquusersearchpage/muquusersearchpage.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwrowdata/vwrowdata.dart';
import 'package:matrixclient2base/modules/base/vwnode/vwnode.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwform/modules/vwform/vwformdefinition/vwformdefinition.dart';
import 'package:vwform/modules/vwwidget/vwnodesubmitpage/vwnodesubmitpage.dart';

class MuquUserPage extends StatelessWidget {
  MuquUserPage({
    super.key,
    required this.appInstanceParam,
    this.initialIndex = 0,
    this.formResponse,
    this.formDefinition,
    this.containerFolderNode,
  }) {
    this.homeTabItemList = [];
    this.createHomeTabItemList();
  }

  final VwAppInstanceParam appInstanceParam;
  final int initialIndex;
  final VwRowData? formResponse;
  final VwFormDefinition? formDefinition;
  final VwNode? containerFolderNode;
  late List<VwHomeTabItem> homeTabItemList;
  static double iconSize = 26;

  void implementRefreshDataOnParentFunction(){

  }

  FloatingActionButton getCreateNewMuquUserPostButton(BuildContext context)
  {
    const widgetKey = "123456789";

    String folderRecordId="response_muquuserpostformdefinition";
    return FloatingActionButton.small(
        heroTag: {"name":2},
        backgroundColor: Color.fromARGB(160, 10, 139, 245),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VwNodeSubmitPage(
                  parentNodeId: folderRecordId,
                  key: Key(widgetKey),
                  formDefinitionIdList:["muquuserpostformdefinition"],
                  appInstanceParam: this.appInstanceParam,
                  refreshDataOnParentFunction:
                  this.implementRefreshDataOnParentFunction,
                )),
          );

        });
  }

  void createHomeTabItemList() {
    homeTabItemList.add(
        MuquUserFeedPage.createPageTabItem(appInstanceParam: appInstanceParam));
    homeTabItemList.add(
        MuquUserSchedulePage.createPageTabItem(
            appInstanceParam: appInstanceParam));
    homeTabItemList.add(
        MuquUserSearchPage.createPageTabItem(
            appInstanceParam: appInstanceParam));

    homeTabItemList.add(
        MuquCurrentUserProfilePage.createPageTabItem(
            appInstanceParam: appInstanceParam));

    /*
    homeTabItemList.add(VwHomePageBase.createRootPage(
        title: "/data",
        appInstanceParam: this.appInstanceParam));*/

  }

  @override
  Widget build(BuildContext context) {

    return VwHomePageBase(
        key: this.key,
        floatingActionButtonAddOn: this.getCreateNewMuquUserPostButton,
        appInstanceParam: this.appInstanceParam,
        homeTabItemList: this.homeTabItemList,
        initialIndex: this.initialIndex,
        formResponse: this.formResponse,
        formDefinition: this.formDefinition,
        containerFolderNode: this.containerFolderNode);
  }
}
