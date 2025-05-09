import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient/modules/edokumen2022/pages/projectaminlandingpage/berandamenuwidget.dart';
import 'package:matrixclient2base/modules/base/vwapicall/apivirtualnode/apivirtualnode.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwfiedvalue/vwfieldvalue.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwrowdata/vwrowdata.dart';
import 'package:nodelistview/modules/nodelistview/nodelistview.dart';
import 'package:uuid/uuid.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwform/modules/vwpublicquestionpage/vwquestionboxwidget.dart';
import 'package:vwform/modules/vwwidget/chartnodelistview/chartnodelistview.dart';
import 'package:vwform/modules/vwwidget/vwformresponseuserpage/vwformresponseuserpage.dart';

class BerandaLandingPage extends StatefulWidget {
  BerandaLandingPage(
      {
        required super.key,
        required this.appInstanceParam,required this.standardArticleMaincategory });

  final VwAppInstanceParam appInstanceParam;
  final String standardArticleMaincategory;


  BerandaLandingPageState createState() => BerandaLandingPageState();
}

class BerandaLandingPageState extends State<BerandaLandingPage> {


  @override
  void initState() {
    super.initState();


  }

  Widget? getTopRowWidget() {
    return Container(
        color: Color.fromARGB(255, 240, 240, 240),
        child: VwQuestionBoxWidget(
          appInstanceParam: this.widget.appInstanceParam,
        ));
  }

  VwRowData apiCallFilterByStandardArticleMaincategory(){
    return VwRowData(recordId: Uuid().v4(),fields: [VwFieldValue(fieldName: "maincategory",valueString: widget.standardArticleMaincategory )]);
  }

  Widget getFeedFolderNode() {
    return VwFormResponseUserPage(

      //topRowWidget: SizedBox(height: 20,),
      rowUpperPadding: 50,
      bottomRowWidget:SizedBox(height: 100,),
      extendedApiCallParam: this.apiCallFilterByStandardArticleMaincategory(),
      appBarMenu:  BerandaMenuWidget(appInstanceParam: this.widget.appInstanceParam,),
      showLoginButton: true,
      toolbarHeight: 50,
      toolbarPadding: 10,
      showSearchIcon: false,
      zeroDataCaption: "(Belum ada artikel)",
      //enableQuestionBoxTopRow: false,
      boxTopRowWidgetMode: ChartNodeListView.btrSearchNodeComment,
      //footer: FooterProjectAminLandingPage(),
      mainHeaderTitleTextColor: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.textColor,
      mainHeaderBackgroundColor: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.primaryColor,
      //topRowWidget: this.getTopRowWidget(),
      enableCreateRecord: false,
      mainLogoMode: NodeListView .mlmLogo,
      mainLogoImageAsset: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.rootLogoPath,
      mainLogoTextCaption: this.widget.appInstanceParam.baseAppConfig.generalConfig.appTitle,
      folderNodeId: APIVirtualNode.exploreNodeFeed,
      key: this.widget.key,
      appInstanceParam: widget.appInstanceParam,
      showReloadButton: false,
      enableAppBar: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget returnValue = Container(child: Text("Error 500: Internal Error"));

    try {
      returnValue = this.getFeedFolderNode();
    } catch (error) {
      print("Error Catched on VwPublicQuestionPage: " + error.toString());
    }
    return returnValue;
  }
}
