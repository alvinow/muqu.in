import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient/modules/xlsviewer/helper/save_file_web.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column;

class XlsViewer extends StatefulWidget{


  XlsViewer({required this.bytes, required this.fileName});
  final List<int> bytes;
  final String fileName;
  XlsViewerState createState()=> XlsViewerState();
}

class XlsViewerState extends State<XlsViewer>{

  @override
  Widget build(BuildContext context) {

    return TextButton.icon(onPressed: () async{
      await saveAndLaunchFile(this.widget.bytes, 'Invoice.xlsx');
    }, icon: Icon(Icons.download,size: 40,), label: Text(widget.fileName));

  }
}