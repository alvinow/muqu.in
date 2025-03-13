import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/dashboard2024realtime/rendermodrekapauditordashboard2024.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/dashboard2024realtime/rendermodrekapcountrekomendasidashboard2024.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/dashboard2024realtime/rendermodrekapscountrekomendasipersatkerdashboard2024.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/dashboard2024realtime/rendermodrekapsumrekomendasidashboard2024.dart';
import 'package:matrixclient/modules/deploy/pages/homepage/dashboard2024realtime/rendermodrekapsumrekomendasipersatkerdashboard2024.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwfiedvalue/vwfieldvalue.dart';
import 'package:matrixclient2base/modules/base/vwdataformat/vwrowdata/vwrowdata.dart';
import 'package:matrixclient2base/modules/base/vwnode/vwnode.dart';
import 'package:matrixclient2base/modules/base/vwnoderequestresponse/vwnoderequestresponse.dart';
import 'package:uuid/uuid.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:vwform/modules/remoteapi/remote_api.dart';
import 'package:vwform/modules/vwappinstanceparam/vwappinstanceparam.dart';
import 'package:vwutil/modules/util/vwdateutil.dart';

class Dashboard2024Realtime extends StatefulWidget {
  Dashboard2024Realtime(
      {this.reloadPeriodic = 600, required this.appInstanceParam});
  final int reloadPeriodic;
  final VwAppInstanceParam appInstanceParam;

  Dashboard2024RealtimeState createState() => Dashboard2024RealtimeState();
}

class Dashboard2024RealtimeState extends State<Dashboard2024Realtime> {
  late StreamController<String> _refreshController;
  VwNode? nodeCurrent;
  DateTime? lastRefresh;
  late bool isVisible;
  late bool isForceRefreshRecord;
  late String currentState;
  Timer? timer;

  static String initRvState = "initRvState";
  static String doRefreshRvState = "doRefreshRvState";
  static String onRefreshRvState = "onRefreshRvState";
  static String standbyRvState = "standbyRvState";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._refreshController = new StreamController<String>();
    isVisible = true;
    this.isForceRefreshRecord = false;
    this.currentState = Dashboard2024RealtimeState.initRvState;
    this.timer = Timer.periodic(
        Duration(seconds: widget.reloadPeriodic), implementOnTimer);
  }

  void implementOnTimer(Timer timer) async {
    // callback function

    setState(() {
      this._handleRefresh();
    });
  }

  @override
  void dispose() {
    if(this.timer!=null)
      {
        this.timer!.cancel();
      }
    this._refreshController.close();
    // TODO: implement dispose
    super.dispose();

  }

  VwRowData apiCallParam() {
    VwRowData returnValue = VwRowData(
        timestamp: VwDateUtil.nowTimestamp(),
        recordId: Uuid().v4(),
        fields: <VwFieldValue>[
          VwFieldValue(
              fieldName: "nodeId",
              valueString: "f937dab6-6df3-4601-8025-99658e30b131"),
          VwFieldValue(
              fieldName: "currentStateKey",
              valueString: this.nodeCurrent != null
                  ? this.nodeCurrent!.stateKey
                  : "<invalid_state_key>"),
        ]);

    return returnValue;
  }

  Future<VwNode?> _asyncLoadData() async {
    VwNode? returnValue = nodeCurrent;
    try {
      currentState = Dashboard2024RealtimeState.onRefreshRvState;

      VwNodeRequestResponse nodeRequestResponse =
          await RemoteApi.nodeRequestApiCall(
              baseUrl: this
                  .widget
                  .appInstanceParam
                  .baseAppConfig
                  .generalConfig
                  .baseUrl,
              graphqlServerAddress: this
                  .widget
                  .appInstanceParam
                  .baseAppConfig
                  .generalConfig
                  .graphqlServerAddress,
              apiCallId: "getNodes",
              apiCallParam: this.apiCallParam(),
              loginSessionId: widget.appInstanceParam.loginResponse != null
                  ? widget.appInstanceParam.loginResponse!.loginSessionId!
                  : "<invalid_loginSessionId>");

      if (nodeRequestResponse.renderedNodePackage!.rootNode != null) {
        bool doUpdateCurrentNode = true;
        VwNode newCandidateNode =
            nodeRequestResponse.renderedNodePackage!.rootNode!;

        if (nodeCurrent != null &&
            nodeCurrent!.stateKey != null &&
            newCandidateNode.stateKey != null &&
            nodeCurrent!.stateKey != newCandidateNode.stateKey) {
        } else if (nodeCurrent != null) {
          doUpdateCurrentNode = false;
        }

        if (doUpdateCurrentNode) {
          nodeCurrent = newCandidateNode;
          returnValue = nodeCurrent;
          setState(() {});
        }
      } else if (nodeRequestResponse.apiCallResponse!.responseStatusCode ==
              200 &&
          nodeRequestResponse.renderedNodePackage != null &&
          nodeRequestResponse.renderedNodePackage!.rootNode == null) {
        setState(() {
          if (this.nodeCurrent != null) {
            this.nodeCurrent!.nodeStatusId = VwNode.nsDeleted;
          }
        });
      }
      currentState = Dashboard2024RealtimeState.standbyRvState;
    } catch (error) {
      print(error.toString());
    }
    currentState = Dashboard2024RealtimeState.standbyRvState;
    return returnValue;
  }

  Future<void> _handleRefresh() async {
    try {
      if (this.isVisible == true || this.isForceRefreshRecord == true) {
        int deltaSeconds = lastRefresh == null
            ? 0
            : DateTime.now().difference(lastRefresh!).inSeconds;
        if ((lastRefresh != null && deltaSeconds > widget.reloadPeriodic) ||
            this.isForceRefreshRecord == true) {
          this.isForceRefreshRecord = false;
          try {
            await this._asyncLoadData();
          } catch (error) {}
          this.lastRefresh = DateTime.now();
        } else if (lastRefresh == null) {
          this.lastRefresh = DateTime.now();
        }
      }
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _refreshController.stream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (this.currentState == Dashboard2024RealtimeState.initRvState) {
            this.currentState = Dashboard2024RealtimeState.onRefreshRvState;
            this._asyncLoadData();
            return Container(
                height: 50,
                child: LoadingIndicator(indicatorType: Indicator.orbit));
          }

          if (this.nodeCurrent != null) {
            return RefreshIndicator(
                onRefresh: _handleRefresh,
                child: VisibilityDetector(
                    key: Key(this.nodeCurrent!.recordId),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 10) {
                        this.isVisible = true;
                      } else {
                        this.isVisible = false;
                      }
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 300,
                              child: RenderModRekapAuditorDashboard2024(
                                  fieldValue: nodeCurrent!.content.rowData!
                                      .getFieldByName(
                                          "rekaplhpperauditorpertahunanggaran")!)),
                      SingleChildScrollView(

                        scrollDirection: Axis.horizontal,
                        child:   Container(
                              //constraints: BoxConstraints(maxWidth: 1200),
                              height: 300,
                              child: RenderModRekapCountRekomendasiDashboard2024(
                                  fieldValue: nodeCurrent!.content.rowData!
                                      .getFieldByName(
                                          "rekaprekomendasisubtemuanpertahunanggaran")!))),
                      SingleChildScrollView(

                        scrollDirection: Axis.horizontal,
                        child:Container(
                              //constraints: BoxConstraints(maxWidth: 1200),
                              height: 300,
                              child: RenderModRekapSumRekomendasiDashboard2024(
                                  fieldValue: nodeCurrent!.content.rowData!
                                      .getFieldByName(
                                          "rekaprekomendasisubtemuanpertahunanggaran")!))),
                          SingleChildScrollView(

                              scrollDirection: Axis.horizontal,
                              child:  Container(
                              child: RenderModRekapCountRekomendasiPerSatkerDashboard2024(
                                  fieldValue: nodeCurrent!.content.rowData!
                                      .getFieldByName(
                                          "rekaprekomendasisubtemuanpersatker")!))),
                          SingleChildScrollView(

                              scrollDirection: Axis.horizontal,
                          child:Container(
                              child: RenderModRekapSumRekomendasiPerSatkerDashboard2024(
                                  fieldValue: nodeCurrent!.content.rowData!
                                      .getFieldByName(
                                          "rekaprekomendasisubtemuanpersatker")!)))
                        ],
                      ),
                    )));
          } else {
            return Container(
                height: 50,
                child: LoadingIndicator(indicatorType: Indicator.orbit));
          }
        });
  }
}
