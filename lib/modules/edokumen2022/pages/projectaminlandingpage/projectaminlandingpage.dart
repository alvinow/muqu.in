import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient/modules/edokumen2022/pages/projectaminlandingpage/berandalandingpage.dart';
import 'package:matrixclient/modules/edokumen2022/pages/projectaminlandingpage/janjilandingpage/janjilandingpage.dart';
import 'package:matrixclient/modules/edokumen2022/pages/projectaminlandingpage/peristiwalandingpage.dart';
import 'package:matrixclient/modules/edokumen2022/pages/projectaminlandingpage/timelinelandingpage/timelinelandingpage.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';


class ProjectAminLandingPage extends StatefulWidget {
  ProjectAminLandingPage(
      {
        required super.key,
        required this.appInstanceParam,required this.standardArticleMaincategory });

  final VwAppInstanceParam appInstanceParam;
  final String standardArticleMaincategory;


  ProjectAminLandingPageState createState() => ProjectAminLandingPageState();
}

class ProjectAminLandingPageState extends State<ProjectAminLandingPage> {


  @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    Widget returnValue = Container(child: Text("Error 500: Internal Error"));

    try {

      if(this.widget.standardArticleMaincategory=="beranda")
        {
          return BerandaLandingPage(key: widget.key, appInstanceParam: widget.appInstanceParam, standardArticleMaincategory: widget.standardArticleMaincategory);
        }
      else if(this.widget.standardArticleMaincategory=="janji")
      {
        return JanjiLandingPage(key: widget.key, appInstanceParam: widget.appInstanceParam,parentarticlenodeid: "<invalid_node_id>",);

      }
      else if(this.widget.standardArticleMaincategory=="peristiwa")
        {
          return PeristiwaLandingPage(key: widget.key, appInstanceParam: widget.appInstanceParam, standardArticleMaincategory: widget.standardArticleMaincategory);

        }
      else if(this.widget.standardArticleMaincategory=="linimasa")
      {
        return TimelineLandingPage(key: widget.key, appInstanceParam: widget.appInstanceParam, standardArticleMaincategory: widget.standardArticleMaincategory);

      }

    } catch (error) {
      print("Error Catched on VwProjectAminLandingPage: " + error.toString());
    }
    return returnValue;
  }
}
