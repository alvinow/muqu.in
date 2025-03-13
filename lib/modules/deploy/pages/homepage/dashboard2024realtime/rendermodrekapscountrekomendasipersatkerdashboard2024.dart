import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwfiedvalue/vwfieldvalue.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwrowdata/vwrowdata.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RenderModRekapCountRekomendasiPerSatkerDashboard2024 extends StatefulWidget {
  RenderModRekapCountRekomendasiPerSatkerDashboard2024({required this.fieldValue});
  final VwFieldValue fieldValue;
  _RenderModRekapRekomendasiPerSatkerDashboard2024State createState() =>
      _RenderModRekapRekomendasiPerSatkerDashboard2024State();
}

class _RenderModRekapRekomendasiPerSatkerDashboard2024State
    extends State<RenderModRekapCountRekomendasiPerSatkerDashboard2024> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  double getWidthBasedOnRecordCount()
  {
    int xRecordCOunt=widget.fieldValue.valueRowDataList!.length;
    return (100*(xRecordCOunt+1))+150;
  }

  static List<ChartData> createChartDataList( List<VwRowData > sourceRowData )
  {
    List<ChartData> returnValue=[];

    String x="satkerkode";
    String y1="rekomendasisubtemuan_count";
    String y2="rekomendasisubtemuan_statustl_1_count";
    String y3="rekomendasisubtemuan_statustl_2_count";
    String y4="rekomendasisubtemuan_statustl_3_count";
    String y5="rekomendasisubtemuan_statustl_4_count";




    for(int la=0;la<sourceRowData.length;la++)
    {
      try {
        VwRowData     currentRowData = sourceRowData[la];
        String xvalue = currentRowData.getFieldByName(x)!.valueString
            .toString();
        double y1value = currentRowData.getFieldByName(y1)!.valueNumber!;
        double y2value = currentRowData.getFieldByName(y2)!.valueNumber!;
        double y3value = currentRowData.getFieldByName(y3)!.valueNumber!;
        double y4value = currentRowData.getFieldByName(y4)!.valueNumber!;
        double y5value = currentRowData.getFieldByName(y5)!.valueNumber!;

        ChartData currentChartData = ChartData(
            xvalue, y1value, y2value, y3value, y4value, y5value);

        returnValue.add(currentChartData);
      }
      catch(error)
      {

      }
    }




    return returnValue;
  }


  @override
  Widget build(BuildContext context) {
    /*
    final List<ChartData> chartData = <ChartData>[
      ChartData('2020', 128, 129, 101,25,60),
      ChartData('2021', 123, 92, 93,30,70),
      ChartData('2022', 107, 106, 90,45,90),
      ChartData('2023', 87, 95, 71,60,500),
    ];*/

    final List<ChartData> chartData =_RenderModRekapRekomendasiPerSatkerDashboard2024State.createChartDataList(widget.fieldValue.valueRowDataList!);


    return Container(

        width: this.getWidthBasedOnRecordCount(),
        height: 300,
        child:Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    title: ChartTitle(text:'Rekap Jumlah Status Rekomendasi Per Satker'),
                    legend: Legend(isVisible: true),
                    primaryXAxis: CategoryAxis(),
                    series: <CartesianSeries>[
                      ColumnSeries<ChartData, String>(
                          color:Colors.blue,
                          name: "Jumlah Rekomendasi",
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y1
                      ),
                      ColumnSeries<ChartData, String>(
                          color:Colors.red,
                          name: "Belum Diproses",
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y2
                      ),
                      ColumnSeries<ChartData, String>(
                          color:Colors.orange,
                          name: "Dalam Proses",
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y3
                      ),
                      ColumnSeries<ChartData, String>(
                          color:Colors.green,
                          name: "Sudah Sesuai",
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y4
                      ),
                      ColumnSeries<ChartData, String>(
                          color:Colors.black45,
                          name: "Tidak Dapat Diproses",
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y5
                      )
                    ]
                )
            )
        )
    ));
  }



}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3,this.y4,this.y5);
  final String x;
  final double? y1;
  final double? y2;
  final double? y3;
  final double? y4;
  final double? y5;
}
