import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/dashboard2024realtime/rendermodrekapcountrekomendasidashboard2024.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CurrentUserActivitySummary extends StatefulWidget{

  CurrentUserActivitySummaryState createState()=>CurrentUserActivitySummaryState();
}

class CurrentUserActivitySummaryState extends State<CurrentUserActivitySummary>
{

  Widget infoBoxModelA({
    required String title,
    required String content,
    required String description
}){
  return Container(margin: EdgeInsets.all(5), child:Column(children: [
    Text(title,style: TextStyle(fontSize: 16),),
    Text(content,style: TextStyle(fontSize: 40),),
    Text(description,style: TextStyle(fontSize: 16),)
  ],));
  }



  @override
  Widget summaryChart(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('10 Maret', 12, 10, 14, 20),
      ChartData('11 Maret', 14, 11, 18, 23),
      ChartData('Kemarin', 16, 10, 15, 20),
      ChartData('Hari ini', 18, 16, 18, 24)
    ];

    return Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <CartesianSeries>[
                      StackedColumnSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y1
                      ),
                      StackedColumnSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y2
                      ),
                      StackedColumnSeries<ChartData,String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y3
                      ),
                      StackedColumnSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y4
                      )
                    ]
                )
            )
        );

  }



  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: PreferredSize(
       preferredSize: Size.fromHeight(45),
       child:
     AppBar(backgroundColor: Colors.blueGrey,title: Text("Aktivitas Pekan ini",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,color: Colors.white),))
       ,) ,
     body: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Container(child:Row(children: [
       this.infoBoxModelA(title:"Tilawah", content: "60", description: "ayat"),
       SizedBox(width: 5,),
       this.infoBoxModelA(title:"Ziyadah", content: "34", description: "ayat"),
       SizedBox(width: 5,),
       this.infoBoxModelA(title:"Muraja'ah", content: "75", description: "ayat"),
       SizedBox(width: 5,),
       this.summaryChart(context)
     ],)))

   );
  }
}

class ChartData{
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
}
