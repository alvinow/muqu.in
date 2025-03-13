import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart' as intl_date_symbol_data_local;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:matrixclient/deployappconfig.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/vwhomepage.dart';
import 'package:matrixclient/modules/edokumen2022/pages/tiketsearch/tiketsearch.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwrowdata/vwrowdata.dart';
import 'package:matrixclient2base/modules/base/vwnode/vwnode.dart';
import 'package:vwform/modules/pagecoordinator/pagecoordinator.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwform/modules/vwform/vwformdefinition/vwformdefinition.dart';

void main() async {

  await intl_date_symbol_data_local.initializeDateFormatting();

  const String appTitle=DeployAppConfig.deployAppId;

  const Key key = Key(appTitle);
  String? myUrl;
  String? pathUrl;
  Uri? inputUri;
  if (kIsWeb) {

    //setHashUrlStrategy();
    //setPathUrlStrategy();
    myUrl = Uri.base.toString();

    //inputUri = Uri.parse(myUrl!);
    //pathUrl=inputUri!.path.toString();
    //pathUrl=pathUrl!.substring(1);

  }

  runApp(BootloaderClass(key: key, url: myUrl.toString()));
}



class BootloaderClass extends StatelessWidget {
 const BootloaderClass({Key? key, required this.url}) : super(key: key);




  final String url;

 Widget homePageFunction({
   required Key? key,
   required VwAppInstanceParam appInstanceParam,
   required int initialIndex,
   VwRowData? formResponse,
   VwFormDefinition? formDefinition,
   VwNode? containerFolderNode,
 } ){
   return VwHomePage(appInstanceParam: appInstanceParam,
     key: key,
     initialIndex: initialIndex,
     formDefinition: formDefinition,
     containerFolderNode: containerFolderNode,
   );
 }

  @override
  Widget build(BuildContext context) {



    final GoRouter _router =  GoRouter(
      initialLocation: "/",
      routes: <RouteBase>[
      GoRoute(
          path:  '/',

          builder: (BuildContext context, GoRouterState state) {
            print("entering main path");




            return   PageCoordinator(
              homePageFunction: this.homePageFunction,
              baseAppConfig: DeployAppConfig(),
              key: super.key,requestUrl: url,);
          },

        ),
        GoRoute(
          path: "/tiket" ,
          builder: (BuildContext context, GoRouterState state) {
            print("entering tiket path");
            return  TicketSearch();
          },
            routes: <RouteBase>[
              GoRoute(
                path: ":tiketId" ,
                builder: (BuildContext context, GoRouterState state) {
                  print("entering detail tiket path");
                  return  PageCoordinator(
                    homePageFunction: this.homePageFunction,
                    baseAppConfig: DeployAppConfig(), key: super.key,goRouterState: state,  requestUrl: url,);
                },
              ),
            ]
        ),
        GoRoute(
          path:  '/admin',
          builder: (BuildContext context, GoRouterState state) {
            print("entering admin  path");
            return  PageCoordinator(
              homePageFunction: this.homePageFunction,
              baseAppConfig: DeployAppConfig(), key: super.key,requestUrl: url,);
          },

        ),


      ],
    );

   // print("pathUrl="+pathUrl.toString());

    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          // ···
          brightness: Brightness.light,
        ),
        inputDecorationTheme:  InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          /*
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),*/
          filled: true, //<-- SEE HERE
          fillColor: Color.fromARGB(255, 230, 230, 230), //<-- SEE HERE
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.white, //<-- SEE HERE
        ),
      ),
      routerConfig: _router,
    );


  }
}
