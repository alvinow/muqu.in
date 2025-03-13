import 'package:flutter/cupertino.dart';
import 'package:vwform/modules/pagecoordinator/bloc/pagecoordinator_bloc.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwform/modules/vwpublicquestionpage/publicqustionbuttonmenuwidget.dart';


class BerandaMenuWidget extends StatefulWidget{
  BerandaMenuWidget({required this.appInstanceParam});
  VwAppInstanceParam appInstanceParam;

  BerandaMenuWidgetState createState()=>BerandaMenuWidgetState();
}

class BerandaMenuWidgetState extends State<BerandaMenuWidget>{
  @override
  Widget build(BuildContext context) {

    Widget returnValue=Container();
    try
        {
        returnValue=Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


            PublicQuestionButtonMenuWidget(
                textColor: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.textColor,
                primaryColor: this.widget.appInstanceParam.baseAppConfig.baseThemeConfig.primaryColor,
                caption: "Peristiwa", onTapButton: (){
              this
                  .widget
                  .appInstanceParam
                  .appBloc
                  .add(PublicLandingPagecoordinatorEvent(standardArticleMaincategory: "peristiwa", timestamp: DateTime.now()));
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

        ],)  ;


        }
        catch(error)
    {

    }
    return returnValue;
  }
}