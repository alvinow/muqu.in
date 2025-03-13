import 'package:flutter/cupertino.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';


class FooterProjectAminLandingPage extends StatefulWidget{
  FooterProjectAminLandingPage({
    required this.appInstanceParam
});

  final VwAppInstanceParam appInstanceParam;

  FooterProjectAminLandingPageState createState()=> FooterProjectAminLandingPageState();
}

class FooterProjectAminLandingPageState extends State<FooterProjectAminLandingPage>
{
  @override
  Widget build(BuildContext context) {

    String caption=this.widget.appInstanceParam.baseAppConfig.generalConfig.copyrightText;

   return Container(
     height: 30,
       color: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.primaryColor,
       child:Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [

       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [Text(caption,style: TextStyle(color: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.textColor,fontWeight: FontWeight.w100,  fontSize: 11),)],)
     ],
   ));
  }
}