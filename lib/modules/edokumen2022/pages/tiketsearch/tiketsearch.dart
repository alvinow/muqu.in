import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:vwform/modules/vwwidget/vwmobilescanner/vwmobilescanner.dart';



class TicketSearch extends StatefulWidget {
  TicketSearchState createState() => TicketSearchState();
}

class TicketSearchState extends State<TicketSearch> {
  late TextEditingController textEditingController;
  late Key scannerKey;


  @override
  void initState() {
    // TODO: implement initState
    this.scannerKey=Key(Uuid().v4());
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {




    return MaterialApp(home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
           InkWell(onTap: () async{
             String url_string = "https://reg.itb99.org";

             final Uri url = Uri.parse(url_string);

             if (!await launchUrl(url)) {
             throw Exception('Could not launch $url');
             }
           }, child:Container(margin: EdgeInsets.fromLTRB(0, 0, 10, 0), child:Text('daftar',style: TextStyle(color: Colors.purple),)))
          ],
          leading: InkWell(onTap: () async{

            String url_string = "https://www.itb99.org";

            final Uri url = Uri.parse(url_string);

            if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
            }

          }, child:Icon(Icons.home_outlined,color: Colors.purple,)) ,
        ),

        body: LayoutBuilder(
      builder: (context, constraint) {
        double width = constraint.maxWidth;

        double screenHeight = MediaQuery.sizeOf(context).height;

        double maxTextFieldWidth=400;
        double minTextFieldWidth=300;
        double margin=width * 0.2;
        if(width * 0.6>maxTextFieldWidth)
          {
            margin=(width-500)*0.5;
          }
        else if(width*0.6<minTextFieldWidth)
          {
            margin=25;
          }

        return SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(margin, screenHeight*0.3, margin, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LayoutBuilder(builder: (context, constraint) {
                      double width = constraint.maxWidth;
                      return Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(
                              width * 0.4, 0, width * 0.4, 0),
                          child:
                              Image.asset("assets/logo/logo_itb99_circle.png"));
                    }),
                    TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        labelText: 'Ticket ID',
                        suffixIcon: InkWell(onTap: ()async{

                          var res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VwMobileScanner(key: this.scannerKey),
                              ));

                          if (res is String) {
                            print(res);
                            this.scannerKey = UniqueKey();

                            if (res.startsWith("https://") == true || res.startsWith("http://") == true )
                              {
                                Uri uri = Uri.parse(res);


                                if(uri.fragment!=null)
                                {
                                  List<String> splitted = uri.fragment.split('/');

                                  if(splitted.length==3)
                                  {
                                     String tiketId= splitted.elementAt(2);
                                     textEditingController.text=tiketId;
                                     context.go("/tiket/" + tiketId);
                                  }

                                }

                              }
                            /*

                            this.scannerKey = UniqueKey();

                            if (res.startsWith("https://") == true) {
                              Uri uri = Uri.parse(res);
                              String? ticketCode = uri.queryParameters["ticketCode"] != null
                                  ? uri.queryParameters["ticketCode"]
                                  : null;

                              if (ticketCode != null) {
                                textEditingController.value =
                                    TextEditingValue(text: ticketCode);
                                searchKeyword = ticketCode;
                              }
                            } else {
                              textEditingController.value = TextEditingValue(text: res);
                              searchKeyword = res;
                            }

                            if (res != "") {
                              print("submitted");
                              FormDefinitionLib.cleanZeroLengthString(this.currentApiCallParam);
                              this.enableFetch = true;

                              pagingController.refresh();
                            } else {
                              print("no keyword");
                            }
                            setStateFunction(context);
                            */
                          }

                          setState(() {});

                        }, child: Icon(Icons.qr_code_scanner,color: Colors.purple,),)
                      ),
                    ),
                    TextButton.icon(

                        onPressed: () {
                          String? keyword = textEditingController.text;
                          print("keyword=" + keyword);
                          context.go("/tiket/" + keyword.toString());
                        },
                        icon: Icon(Icons.search,color: Colors.purpleAccent,),
                        label: Text("Cari",style: TextStyle(color: Colors.purpleAccent),)),
                    SizedBox(height: 100,)

                  ],
                )));
      },
    )));
  }
}
