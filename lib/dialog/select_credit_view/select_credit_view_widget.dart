import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'select_credit_view_model.dart';
export 'select_credit_view_model.dart';

class SelectCreditViewWidget extends StatefulWidget {
  const SelectCreditViewWidget({super.key});

  @override
  State<SelectCreditViewWidget> createState() => _SelectCreditViewWidgetState();
}

class _SelectCreditViewWidgetState extends State<SelectCreditViewWidget> {
  late SelectCreditViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectCreditViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
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
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: Text('ยืนยัน?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('ยกเลิก'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('ยืนยัน'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      FFAppState().creditSelected = '30000';
                      Navigator.pop(context, true);
                    }
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          '300 บาท',
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 24.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: Text('ยืนยัน?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('ยกเลิก'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('ยืนยัน'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      FFAppState().creditSelected = '50000';
                      Navigator.pop(context, true);
                    }
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          '500 บาท',
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 24.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: Text('ยืนยัน?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('ยกเลิก'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('ยืนยัน'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      FFAppState().creditSelected = '100000';
                      Navigator.pop(context, true);
                    }
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          '1,000 บาท',
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 24.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
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
