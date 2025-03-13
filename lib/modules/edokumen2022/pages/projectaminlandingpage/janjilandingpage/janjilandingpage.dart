import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient/modules/edokumen2022/pages/projectaminlandingpage/janjilandingpage/janjimenuwidget.dart';
import 'package:nodelistview/modules/nodelistview/nodelistview.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwform/modules/vwwidget/vwformresponseuserpage/vwformresponseuserpage.dart';

class JanjiLandingPage extends StatefulWidget{

  const JanjiLandingPage({
    super.key,
    required this.parentarticlenodeid,
    required this.appInstanceParam
  });

  final String parentarticlenodeid;
  final VwAppInstanceParam appInstanceParam;
  JanjiLandingPageState createState()=> JanjiLandingPageState();
}

class JanjiLandingPageState extends State<JanjiLandingPage>{
  late Key formUserResponseKey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    super.initState();

    this.formUserResponseKey = UniqueKey();
    if (this.widget.key != null) {
      this.formUserResponseKey = this.widget.key!;
    }
  }

  bool getEnableCommentBoxBottomSide(){
    bool returnValue=false;
    try
    {
      if(this.widget.appInstanceParam.loginResponse!=null && this.widget.appInstanceParam.loginResponse!.userInfo!=null )
      {
        returnValue=true;
      }

    }
    catch(error)
    {

    }
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
      appBarMenu:  JanjiMenuWidget (appInstanceParam: this.widget.appInstanceParam,),
      bottomSideMode:NodeListView.bsmDisabled,
      zeroDataCaption: "(Belum ada janji)",
      toolbarHeight: 50,
      toolbarPadding: 10,
      rowUpperPadding: 50,
      enableAppBar: true,
      showBackArrow: false,
      enableScaffold: true,
      showUserInfoIcon: false,
      showLoginButton: false,
      showSearchIcon: true,
      mainHeaderTitleTextColor: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.textColor,
      mainHeaderBackgroundColor: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.primaryColor,
      mainLogoMode: NodeListView.mlmLogo,
      mainLogoImageAsset: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.rootLogoPath,
      mainLogoTextCaption: this.widget.appInstanceParam.baseAppConfig.generalConfig.appTitle,
      enableCreateRecord: false,
      folderNodeId: "15b492f8-e4fb-496d-a999-a4afc39bc184",
      key: this.formUserResponseKey,
      appInstanceParam: widget.appInstanceParam,
      showReloadButton: false,

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