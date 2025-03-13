import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vwform/modules/pagecoordinator/bloc/pagecoordinator_bloc.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwform/modules/vwpublicquestionpage/publicqustionbuttonmenuwidget.dart';


class PeristiwaMenuWidget extends StatefulWidget{
  PeristiwaMenuWidget({required this.appInstanceParam});
  VwAppInstanceParam appInstanceParam;

  PeristiwaMenuWidgetState createState()=>PeristiwaMenuWidgetState();
}

class PeristiwaMenuWidgetState extends State<PeristiwaMenuWidget>{
  @override
  Widget build(BuildContext context) {

    Widget returnValue=Container();
    try
    {
      returnValue=Container(
          color: Colors.transparent,

          child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PublicQuestionButtonMenuWidget(
              textColor: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.textColor,
              primaryColor: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.primaryColor,

              caption: "Beranda", onTapButton: (){
            this
                .widget
                .appInstanceParam
                .appBloc
                .add(PublicLandingPagecoordinatorEvent(standardArticleMaincategory: "beranda", timestamp: DateTime.now()));
          }),


          PublicQuestionButtonMenuWidget(
              textColor: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.textColor,
              primaryColor: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.primaryColor,
              caption: "Linimasa", onTapButton: (){
            this
                .widget
                .appInstanceParam
                .appBloc
                .add(PublicLandingPagecoordinatorEvent(standardArticleMaincategory: "linimasa", timestamp: DateTime.now()));
          }),



          /*
          PublicQuestionButtonMenuWidget(textColor: AppConfig.primaryColor, primaryColor: AppConfig.textColor, caption: "Sign in", onTapButton: (){
            this
                .widget
                .appInstanceParam
                .appBloc
                .add(LoginPagecoordinatorEvent(timestamp: DateTime.now()));

          }),*/

        ],))  ;


    }
    catch(error)
    {

    }
    return returnValue;
  }
}