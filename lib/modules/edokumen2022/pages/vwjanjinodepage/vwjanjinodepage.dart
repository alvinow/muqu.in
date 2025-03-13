import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwfiedvalue/vwfieldvalue.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwrowdata/vwrowdata.dart';
import 'package:matrixclient2base/modules/base/vwlinknode/vwlinknode.dart';
import 'package:matrixclient2base/modules/base/vwnode/vwnode.dart';
import 'package:nodelistview/modules/nodelistview/nodelistview.dart';

import 'package:uuid/uuid.dart';
import 'package:vwform/modules/mediaviewerpage/mediaviewerpage.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwform/modules/vwwidget/vwformresponseuserpage/vwformresponseuserpage.dart';

class VwJanjiNodePage extends StatefulWidget {
  const VwJanjiNodePage({
    super.key,
    required this.parentarticlenodeid,
    this.parentArticleNode,
    required this.appInstanceParam,
  });

  final String parentarticlenodeid;
  final VwNode? parentArticleNode;
  final VwAppInstanceParam appInstanceParam;

  VwJanjiNodePageState createState() => VwJanjiNodePageState();
}

class VwJanjiNodePageState extends State<VwJanjiNodePage> {
  late Key formUserResponseKey;
  @override
  void initState() {
    super.initState();
    super.initState();

    this.formUserResponseKey = UniqueKey();
    if (this.widget.key != null) {
      this.formUserResponseKey = this.widget.key!;
    }
  }

  bool getEnableCommentBoxBottomSide() {
    bool returnValue = false;
    try {
      if (this.widget.appInstanceParam.loginResponse != null &&
          this.widget.appInstanceParam.loginResponse!.userInfo != null) {
        returnValue = true;
      }
    } catch (error) {}
    return returnValue;
  }

  @override
  Widget getFeedFolderNode() {
    /*
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,),
      body:Text("test App Bar")
    );*/

    return VwFormResponseUserPage(
      mainLogoImageAsset: this.widget.appInstanceParam.baseAppConfig.generalConfig.mainLogoPath,
      parentArticleNode: widget.parentArticleNode,
      boxTopRowWidgetMode: NodeListView.btrMediaViewer,
      bottomSideMode: getEnableCommentBoxBottomSide()
          ? NodeListView.bsmVideoPointerBox
          : NodeListView.bsmDisabled,
      zeroDataCaption: "(Belum Ada Janji)",
      enableAppBar: true,
      showBackArrow: true,
      enableScaffold: true,
      showUserInfoIcon: false,
      showLoginButton: false,
      mainHeaderTitleTextColor: Colors.black,
      mainHeaderBackgroundColor: Colors.white,
      enableCreateRecord: false,
      mainLogoTextCaption: "Janji",
      folderNodeId: "15b492f8-e4fb-496d-a999-a4afc39bc184",
      key: this.formUserResponseKey,
      appInstanceParam: widget.appInstanceParam,
      showReloadButton: false,
      extendedApiCallParam: VwRowData(recordId: Uuid().v4(), fields: [
        VwFieldValue(
            fieldName: "parentarticlenodeid",
            valueString: this.widget.parentarticlenodeid)
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget returnValue = Container(child: Text("Error 500: Internal Error"));

    try {
      returnValue = MediaViewerPage(
          mediaLinkNode: VwLinkNode(
              nodeId: widget.parentArticleNode!.recordId,
              nodeType: VwNode.ntnRowData,
              /*cache: VwLinkNodeRendered(
                  renderedDate: DateTime.now(),
                  node: widget.parentArticleNode) */),
          appInstanceParam: widget.appInstanceParam);
    } catch (error) {
      print("Error Catched on VwPublicQuestionPage: " + error.toString());
    }
    return returnValue;
  }
}
