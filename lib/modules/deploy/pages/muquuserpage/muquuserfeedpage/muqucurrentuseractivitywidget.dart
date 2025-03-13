import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwfiedvalue/vwfieldvalue.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwrowdata/vwrowdata.dart';
import 'package:matrixclient2base/modules/base/vwnode/vwnode.dart';
import 'package:matrixclient2base/modules/base/vwnode/vwnode.dart';
import 'package:vwutil/modules/util/nodeutil.dart';
import 'package:vwutil/modules/util/vwdateutil.dart';

class MuquCurrentUserActivityWidget extends StatefulWidget
{
  MuquCurrentUserActivityWidget({required this.renderedNode});

  final VwNode renderedNode;

  MuquCurrentUserActivityWidgetState createState()=>MuquCurrentUserActivityWidgetState();
}

class MuquCurrentUserActivityWidgetState extends State<MuquCurrentUserActivityWidget>{
  /*

    String jenisAktivitasCaption="tilawah";
    String suratAwalCaption="Al-Fatihaa 1-7";
    String suratAkhirCaption=", Al-Bagaraa 1-286";


    String tanggalCaption="Hari ini";
    Color tanggalColor=Colors.lightGreen;

   */
  
  VwRowData getRowData(){
    return this.widget.renderedNode.content.rowData!;
  }

  String getJenisAktivitasCaption(){
    String returnValue="";
    try
    {
       VwFieldValue? jenisPostFieldValue=  this.getRowData().getFieldByName("jenispost");


       returnValue= NodeUtil.getNode(linkNode: jenisPostFieldValue!.valueLinkNode!)!.content.rowData!.getFieldByName("nama")!.valueString!;

    }
    catch(error)
    {
      
    }

    return returnValue;
  }
  String getSuratAwalCaption(){
    String returnValue="";
    String mulaiSurat="";
    int? mulaiAyat;
    int? selesaiAyat;
    try
        {
          VwFieldValue? formdetailFieldValue=  this.getRowData().getFieldByName("formdetailpost");

         if(formdetailFieldValue!.valueFormResponse!.collectionName=="muqusetoranayatformdefinition")
           {
             mulaiSurat=NodeUtil.getNode(linkNode:   formdetailFieldValue.valueFormResponse!.getFieldByName("quranmulaisurat")!.valueLinkNode!)!.content.rowData!.getFieldByName("nama")!.valueString!;

             try {
               mulaiAyat =
                   formdetailFieldValue.valueFormResponse!.getFieldByName(
                       "quranmulaisuratmulaiayat")!.valueNumber!.toInt();
             }
             catch(error)
    {

    }

             try {
               selesaiAyat =
                   formdetailFieldValue.valueFormResponse!.getFieldByName(
                       "quranmulaisuratselesaiayat")!.valueNumber!.toInt();
             }
             catch(error)
             {

             }

           }

         returnValue=mulaiSurat;

         if(mulaiAyat!=null)
           {
             returnValue=mulaiSurat+" "+mulaiAyat.toString();

             if(selesaiAyat!=null)
               {
                 returnValue=returnValue+"-"+selesaiAyat.toString();
               }
           }


          
        }
        catch(error)
    {

    }
    return returnValue;
  }

  String getSuratAkhirCaption()
  {
    String returnValue="";
    String mulaiSurat="";
    int? mulaiAyat;
    int? selesaiAyat;
    try
    {
      VwFieldValue? formdetailFieldValue=  this.getRowData().getFieldByName("formdetailpost");

      if(formdetailFieldValue!.valueFormResponse!.collectionName=="muqusetoranayatformdefinition")
      {
        mulaiSurat=NodeUtil.getNode(linkNode:   formdetailFieldValue.valueFormResponse!.getFieldByName("quranselesaisurat")!.valueLinkNode!)!.content.rowData!.getFieldByName("nama")!.valueString!;

        try {
          mulaiAyat =
              formdetailFieldValue.valueFormResponse!.getFieldByName(
                  "quranselesaisuratmulaiayat")!.valueNumber!.toInt();
        }
        catch(error)
        {

        }

        try {
          selesaiAyat =
              formdetailFieldValue.valueFormResponse!.getFieldByName(
                  "quranselesaisuratselesaiayat")!.valueNumber!.toInt();
        }
        catch(error)
        {

        }

      }

      returnValue=mulaiSurat;

      if(mulaiAyat!=null)
      {
        returnValue=mulaiSurat+" "+mulaiAyat.toString();

        if(selesaiAyat!=null)
        {
          returnValue=returnValue+"-"+selesaiAyat.toString();
        }
      }



    }
    catch(error)
    {

    }
    return returnValue;
  }

  String getSuratCaption()
  {
    String returnValue=this.getSuratAwalCaption();
    if(this.getSuratAkhirCaption().length>1)
      {
        returnValue=returnValue+", "+this.getSuratAkhirCaption();
;      }

    return returnValue;
  }

  String getTanggalCaption(){
    String returnValue="";
    try
    {
        if(this.widget.renderedNode.timestamp!.created.difference(DateTime.now()).inDays==0)
          {
            returnValue="Hari ini";
          }
        else if(this.widget.renderedNode.timestamp!.created.difference(DateTime.now()).inDays==0)
        {
          returnValue="Kemarin";
        }
        else{


          returnValue=VwDateUtil.indonesianShortFormatLocalTimeZone(this.widget.renderedNode.timestamp!.created);
        }
    }
    catch(error)
    {

    }
    return returnValue;
  }

  Color getTanggalColor(){
    Color returnValue=Colors.black;
    try
    {
      if(this.widget.renderedNode.timestamp!.created.difference(DateTime.now()).inDays==0)
      {
        returnValue=Colors.green;
      }
      else if(this.widget.renderedNode.timestamp!.created.difference(DateTime.now()).inDays==0)
      {
        returnValue=Colors.orange;
      }

    }
    catch(error)
    {

    }
    return returnValue;
  }




  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 7), child:Row(children: [Text(this.getTanggalCaption()+" ",style: TextStyle(color: this.getTanggalColor(), fontWeight: FontWeight.w600),),Text(this.getJenisAktivitasCaption()+" ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),), Text(this.getSuratCaption(),style: TextStyle(color: Colors.black)) ],) ,);

  }
}