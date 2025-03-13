import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/vwhometabitem/vwhometabitem.dart';
import 'package:matrixclient/modules/deploy/pages/muquuserpage/muquuserfeedpage/currentuseractivitysummary.dart';
import 'package:matrixclient/modules/deploy/pages/muquuserpage/muquuserfeedpage/muqucircleactivitywidget.dart';
import 'package:matrixclient/modules/deploy/pages/muquuserpage/muquuserfeedpage/muqucurrentuseractivitywidget.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwfiedvalue/vwfieldvalue.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwrowdata/vwrowdata.dart';
import 'package:matrixclient2base/modules/base/vwnode/vwnode.dart';
import 'package:nodelistview/modules/nodelistview/nodelistview.dart';
import 'package:uuid/uuid.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwform/modules/vwform/vwform.dart';
import 'package:vwform/modules/vwwidget/vwformresponseuserpage/vwdefaultrowviewer/vwdefaultrowviewer.dart';
import 'package:vwform/modules/vwwidget/vwnodesubmitpage/vwnodesubmitpage.dart';
import 'package:vwutil/modules/util/nodeutil.dart';
import 'package:vwutil/modules/util/vwdateutil.dart';
import 'package:vwutil/modules/util/vwrowdatautil.dart';

class MuquUserFeedPage extends StatefulWidget {




  MuquUserFeedPage({
    required this.appInstanceParam,
    this.folderRecordId="response_muquuserpostformdefinition"
});

  final VwAppInstanceParam appInstanceParam;
  final String folderRecordId;


  static VwHomeTabItem createPageTabItem(
      {required VwAppInstanceParam appInstanceParam,double iconSize=25}) {
    return VwHomeTabItem(
        buttonSelected: BottomNavigationBarItem(
          icon: Icon(Icons.home,
              size: iconSize*1.2),
          label: 'Home',
        ),
        buttonUnselected: BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined,
              size: iconSize),
          label: 'Home',
        ),
        tabPage:
        MuquUserFeedPage(appInstanceParam: appInstanceParam)

    );
  }

  MuquUserFeedPageState createState() => MuquUserFeedPageState();
}

class MuquUserFeedPageState extends State<MuquUserFeedPage> {

  Widget muquUserPostLastActivityUserCircleNodeRowViewer(
      {required VwNode renderedNode,
        required BuildContext context,
        required int index,
        Widget? topRowWidget,
        String? highlightedText,
        RefreshDataOnParentFunction? refreshDataOnParentFunction,
        CommandToParentFunction? commandToParentFunction}) {
    //this.localRefreshDataOnParentFunction = refreshDataOnParentFunction;
    try {
      if (renderedNode.nodeType == VwNode.ntnTopNodeInsert) {
        if (topRowWidget != null) {
          return topRowWidget;
        } else {
          return Container();
        }
      }


      VwRowData currentRowData = renderedNode.content.rowData!;

      VwFieldValue? muquuserFieldValue = currentRowData.getFieldByName(
          "muquuser");

      VwNode? muquuserNode=  NodeUtil.getNode(linkNode: muquuserFieldValue!.valueLinkNode!);




      String displayUsername = muquuserNode!.content.rowData!.getFieldByName("nama")!.valueString!;

    String jenisAktivitasCaption="tilawah";
    String suratAwalCaption="Al-Fatihaa 1-7";
    String suratAkhirCaption=", Al-Bagaraa 1-286";

    String namaKelas="LTQ A - Tahfizh 1";
    String namaLembaga="Tahfizk Al-Mulk";

    String tanggalCaption="Hari ini";
    Color tanggalColor=Colors.lightGreen;
    Color jenisAktivitasColor=Colors.black;


    return MuquCircleActivityWidget(renderedNode: renderedNode);

    return
      Container(margin: EdgeInsets.fromLTRB(8, 0, 0, 8), child:Column(

        children: [
       Row(children: [   Text(displayUsername+" ",style:TextStyle(color: Colors.black, fontWeight: FontWeight.w600) )]),
      Container(margin: EdgeInsets.fromLTRB(8, 0, 0, 0), child:Row(children:[Text(namaKelas),Text(namaLembaga)])),
      Container(margin: EdgeInsets.fromLTRB(8, 0, 0, 0), child:Row(children: [  Text(tanggalCaption+" ",style: TextStyle(color: tanggalColor, fontWeight: FontWeight.w600),),Text(jenisAktivitasCaption+" ",style: TextStyle(color: jenisAktivitasColor,fontWeight: FontWeight.w600),), Text(suratAwalCaption+" ",style: TextStyle(color: jenisAktivitasColor)),Text(suratAkhirCaption+" ",style: TextStyle(color: jenisAktivitasColor)) ],) ,)

    ],
      ));
    }
    catch(error)
    {

    }
    return Container(child:Text(renderedNode.recordId));
  }

  Widget muquUserPostLastActivityCurrentUserNodeRowViewer(
      {required VwNode renderedNode,
        required BuildContext context,
        required int index,
        Widget? topRowWidget,
        String? highlightedText,
        RefreshDataOnParentFunction? refreshDataOnParentFunction,
        CommandToParentFunction? commandToParentFunction}) {
    //this.localRefreshDataOnParentFunction = refreshDataOnParentFunction;

    if (renderedNode.nodeType == VwNode.ntnTopNodeInsert) {
      if (topRowWidget != null) {
        return topRowWidget;
      } else {
        return Container();
      }
    }

    return MuquCurrentUserActivityWidget(renderedNode:renderedNode);

    String jenisAktivitasCaption="tilawah";
    String suratAwalCaption="Al-Fatihaa 1-7";
    String suratAkhirCaption=", Al-Bagaraa 1-286";


    String tanggalCaption="Hari ini";
    Color tanggalColor=Colors.lightGreen;
    Color jenisAktivitasColor=Colors.black;


    return Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 7), child:Row(children: [Text(tanggalCaption+" ",style: TextStyle(color: tanggalColor, fontWeight: FontWeight.w600),),Text(jenisAktivitasCaption+" ",style: TextStyle(color: jenisAktivitasColor,fontWeight: FontWeight.w600),), Text(suratAwalCaption+" ",style: TextStyle(color: jenisAktivitasColor)),Text(suratAkhirCaption+" ",style: TextStyle(color: jenisAktivitasColor)) ],) ,);
  }

  Widget nodeRowViewer(
      {required VwNode renderedNode,
        required BuildContext context,
        required int index,
        Widget? topRowWidget,
        String? highlightedText,
        RefreshDataOnParentFunction? refreshDataOnParentFunction,
        CommandToParentFunction? commandToParentFunction}) {
    //this.localRefreshDataOnParentFunction = refreshDataOnParentFunction;

    if (renderedNode.nodeType == VwNode.ntnTopNodeInsert) {
      if (topRowWidget != null) {
        return topRowWidget;
      } else {
        return Container();
      }
    }

    return VwDefaultRowViewer(
      key: Key(renderedNode.recordId),
      rowNode: renderedNode,
      appInstanceParam: this.widget.appInstanceParam,
      highlightedText: highlightedText,
    );
  }

  VwRowData apiCallParamLastCurrentUserActivity() {
    VwRowData returnValue = VwRowData(
        timestamp: VwDateUtil.nowTimestamp(),
        recordId: Uuid().v4(),
        fields: <VwFieldValue>[
          VwFieldValue(
              fieldName: "nodeId", valueString: this.widget.folderRecordId),
          /*
          VwFieldValue(
              fieldName: "creatorUserId", valueString: this.widget.appInstanceParam.loginResponse!.userInfo!.user.recordId),
          */
          VwFieldValue(fieldName: "depth", valueNumber: 1),
          VwFieldValue(
              fieldName: "depth1FilterObject",
              valueTypeId: VwFieldValue.vatObject,
              value: { "creatorUserId": this.widget.appInstanceParam.loginResponse!.userInfo!.user.recordId }),
          VwFieldValue(
              fieldName: "sortObject",
              valueTypeId: VwFieldValue.vatObject,
              value: {"timestamp.created":-1}),
          VwFieldValue(
              fieldName: "disableUserGroupPOV",
              valueTypeId: VwFieldValue.vatBoolean,
              valueBoolean: false),
        ]);

    /*
    if (this.widget.extendedApiCallParam != null) {
      VwRowDataUtil.updateFields(
          current: returnValue, candidate: this.widget.extendedApiCallParam!);
    }*/

    return returnValue;
  }

  VwRowData apiCallParamCircleLastActivity() {
    VwRowData returnValue = VwRowData(
        timestamp: VwDateUtil.nowTimestamp(),
        recordId: Uuid().v4(),
        fields: <VwFieldValue>[
          VwFieldValue(
              fieldName: "nodeId", valueString: this.widget.folderRecordId),
          VwFieldValue(fieldName: "depth", valueNumber: 1),
          /*
          VwFieldValue(
              fieldName: "depth1FilterObject",
              valueTypeId: VwFieldValue.vatObject,
              value: { "creatorUserId": {r"$ne" : this.widget.appInstanceParam.loginResponse!.userInfo!.user.recordId} }),

          */

          VwFieldValue(
              fieldName: "sortObject",
              valueTypeId: VwFieldValue.vatObject,
              value: {"timestamp.created":-1}),
          VwFieldValue(
              fieldName: "disableUserGroupPOV",
              valueTypeId: VwFieldValue.vatBoolean,
              valueBoolean: true),
        ]);

    /*
    if (this.widget.extendedApiCallParam != null) {
      VwRowDataUtil.updateFields(
          current: returnValue, candidate: this.widget.extendedApiCallParam!);
    }*/

    return returnValue;
  }

  void implementRefreshDataOnParentFunction(){

}


  Widget getCreateNewMuquUserPostButton()
  {
    const widgetKey = "123456789";


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
                  parentNodeId: this.widget.folderRecordId,
                  key: Key(widgetKey),
                  formDefinitionIdList:["muquuserpostformdefinition"],
                  appInstanceParam: widget.appInstanceParam,
                  refreshDataOnParentFunction:
                  this.implementRefreshDataOnParentFunction,
                )),
          );

        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: this.widget.key,
       // floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
       // floatingActionButton: getCreateNewMuquUserPostButton(),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize:  Size.fromHeight(55.0),
          child: AppBar(
              actions: [Icon(Icons.notifications,size: 30,)],
            title: Container(margin: EdgeInsets.fromLTRB(0, 5, 0, 5), child:Text("Assalamu'alaikum \n"+this.widget.appInstanceParam.loginResponse!.userInfo!.user.displayname,style: TextStyle(fontSize: 20),))),

          ),


        body:SingleChildScrollView(
          child: Column(children:[
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.all(7),
              height: 180,
              child: CurrentUserActivitySummary(),
            ),

            Container(
              margin: EdgeInsets.all(7),
              height: 200,
              child:
              NodeListView (showReloadButton: false, toolbarHeight: 40,  showPrintButton: false, mainHeaderTitleTextColor: Colors.white, mainHeaderBackgroundColor: Colors.blueGrey, mainLogoMode: NodeListView.mlmText, mainLogoTextCaption: "Aktivitas Terakhir", appInstanceParam: widget.appInstanceParam, apiCallParam: this.apiCallParamLastCurrentUserActivity(), nodeRowViewerFunction: muquUserPostLastActivityCurrentUserNodeRowViewer, mainLogoImageAsset: this.widget.appInstanceParam.baseAppConfig.generalConfig.mainLogoPath),
            ),
            Container(
              margin: EdgeInsets.all(7),
              height: 250,
              child:
              NodeListView(showReloadButton: false,toolbarHeight: 40,showPrintButton: false, mainHeaderTitleTextColor: Colors.white, mainHeaderBackgroundColor: Colors.blueGrey, mainLogoMode: NodeListView.mlmText, mainLogoTextCaption: "Aktivitas Teman", appInstanceParam: widget.appInstanceParam, apiCallParam: this.apiCallParamCircleLastActivity(), nodeRowViewerFunction: muquUserPostLastActivityUserCircleNodeRowViewer, mainLogoImageAsset: this.widget.appInstanceParam.baseAppConfig.generalConfig.mainLogoPath),
            )
          ]),
        )

    );

  }
}
