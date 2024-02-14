import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_view_model.dart';
export 'payment_view_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:omise_flutter/omise_flutter.dart';
import 'dart:developer';

class PaymentViewWidget extends StatefulWidget {
  const PaymentViewWidget({super.key});

  @override
  State<PaymentViewWidget> createState() => _PaymentViewWidgetState();
}

class _PaymentViewWidgetState extends State<PaymentViewWidget> {
  late PaymentViewModel _model;

  static const publicKey = "pkey_test_5x1h5fbuqkwm8g53lm0";
  OmiseFlutter omise = OmiseFlutter(publicKey);

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      exampleCreateSource();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  String basicAuth(publicKey) {
    return 'Basic ${base64Encode(utf8.encode('$publicKey:'))}';
  }

  exampleCreateSource() async {
    print(">>>>>>>>>>>>>>exampleCreateSource");
    try {
      final source = await omise.source.create(10000, "THB", "promptpay");
      print("source.id : ${source.id}");
      /*print("source.object : ${source.object}");
      print("source.id : ${source.id}");
      print("source.livemode : ${source.livemode}");
      print("source.location : ${source.location}");
      print("source.createdAt : ${source.createdAt}");
      print("source.type : ${source.type}");
      print("source.flow : ${source.flow}");
      print("source.amount : ${source.amount}");
      print("source.currency : ${source.currency}");
      print("source.mobileNumber : ${source.mobileNumber}");
      print("source.phoneNumber : ${source.phoneNumber}");
      print("source.references : ${source.references}");
      print("source.name : ${source.name}");
      print("source.email : ${source.email}");
      print("source.barcode : ${source.barcode}");
      print("source.storeId : ${source.storeId}");
      print("source.storeName : ${source.storeName}");
      print("source.terminalId : ${source.terminalId}");
      print("source.installmentTerm : ${source.installmentTerm}");
      print("source.zeroInterestInstallments : ${source.zeroInterestInstallments}");
      print("source.scannableCode : ${source.scannableCode}");*/
      //exampleRetrieveCapability();
      payment(source.id);
    } catch (e) {
      // error(e);
      print(e);
    }
  }

  payment(token) async {
    const url = 'https://api.omise.co/charges';

    // อันนี้ได้
    Map<String, String> header = {
      'Authorization': basicAuth("skey_test_5x1cv8dk84i1twgjbxv"),
      'Omise-Version': '2019-05-29',
      'Cache-Control': 'no-cache',
      'Content-Type': 'application/json',
      'user-agent': 'co.keerati.omise_flutter/0.1.6'
    };

    print("header");
    print(header);

    var requestBody = {
      'source': token,
      'amount': "10000",
      'currency': "THB",
    };

    print("requestBody");
    print(requestBody);

    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: header);

    if (response.statusCode == 200) {
      print('successful!');
      //print('Photo URL: ${response.body}');

      Map<String, dynamic> jsonData = jsonDecode(response.body);
      print(jsonData["source"]["scannable_code"]["image"]["download_uri"]);

      setState(() {
        _model.qrPath = "https://silver-api.com/qr.php?path=${jsonData["source"]["scannable_code"]["image"]["download_uri"].toString().replaceAll("https://", "")}";
        print("_model.qrPath");
        print(_model.qrPath);
      });

      _model.paymentID = jsonData["id"];
      await FFAppState()
          .tranferReferent!
          .update(createTranferHistoryListRecordData(
        paymentId: _model.paymentID,
      ));

    } else {
      print('failed with status code: ${response.statusCode}');
      print('${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return (MediaQuery.sizeOf(context).width * 0.8);
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return (MediaQuery.sizeOf(context).width * 0.8);
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 500.0;
          } else {
            return 500.0;
          }
        }(),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.qrPath != null && _model.qrPath != '')
                  FlutterFlowWebView(
                    content: _model.qrPath!,
                    bypass: false,
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 420.0,
                    verticalScroll: false,
                    horizontalScroll: false,
                  ),
                StreamBuilder<TranferHistoryListRecord>(
                  stream: TranferHistoryListRecord.getDocument(
                      FFAppState().tranferReferent!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final buttonTranferHistoryListRecord = snapshot.data!;
                    return FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: buttonTranferHistoryListRecord.status == 1
                          ? 'Success'
                          : 'Processing...',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  },
                ),
              ]
                  .divide(SizedBox(height: 8.0))
                  .addToStart(SizedBox(height: 16.0))
                  .addToEnd(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
