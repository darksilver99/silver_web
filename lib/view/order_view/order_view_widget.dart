import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'order_view_model.dart';
export 'order_view_model.dart';

class OrderViewWidget extends StatefulWidget {
  const OrderViewWidget({super.key});

  @override
  State<OrderViewWidget> createState() => _OrderViewWidgetState();
}

class _OrderViewWidgetState extends State<OrderViewWidget> {
  late OrderViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderViewModel());

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

    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'เลขที่ซื้อ',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 32.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: PagedListView<DocumentSnapshot<Object?>?,
                        OrderListRecord>(
                      pagingController: _model.setListViewController(
                        OrderListRecord.collection
                            .where(
                              'create_by',
                              isEqualTo: currentUserReference,
                            )
                            .orderBy('create_date', descending: true),
                      ),
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate:
                          PagedChildBuilderDelegate<OrderListRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, listViewIndex) {
                          final listViewOrderListRecord = _model
                              .listViewPagingController!
                              .itemList![listViewIndex];
                          return Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'เลข ${listViewOrderListRecord.product} ราคา ${listViewOrderListRecord.price.toString()} บาท',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: () {
                                                    if (listViewOrderListRecord
                                                            .productStatus ==
                                                        'รอประกาศผล') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .tertiary;
                                                    } else if (listViewOrderListRecord
                                                            .productStatus ==
                                                        'ถูกรางวัล') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .success;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primaryText;
                                                    }
                                                  }(),
                                                  fontSize: 22.0,
                                                ),
                                          ),
                                          Text(
                                            '${dateTimeFormat('d/M/y', listViewOrderListRecord.createDate)} ${dateTimeFormat('Hm', listViewOrderListRecord.createDate)}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Text(
                                          listViewOrderListRecord.productStatus,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: () {
                                                  if (listViewOrderListRecord
                                                          .productStatus ==
                                                      'รอประกาศผล') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary;
                                                  } else if (listViewOrderListRecord
                                                          .productStatus ==
                                                      'ถูกรางวัล') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .success;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText;
                                                  }
                                                }(),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
