import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'history_tranfer_view_model.dart';
export 'history_tranfer_view_model.dart';

class HistoryTranferViewWidget extends StatefulWidget {
  const HistoryTranferViewWidget({super.key});

  @override
  State<HistoryTranferViewWidget> createState() =>
      _HistoryTranferViewWidgetState();
}

class _HistoryTranferViewWidgetState extends State<HistoryTranferViewWidget> {
  late HistoryTranferViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryTranferViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'ประวัติการ ฝาก-ถอน เงิน',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 32.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                PagedListView<DocumentSnapshot<Object?>?,
                    TranferHistoryListRecord>(
                  pagingController: _model.setListViewController(
                    TranferHistoryListRecord.collection
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
                      PagedChildBuilderDelegate<TranferHistoryListRecord>(
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
                      final listViewTranferHistoryListRecord = _model
                          .listViewPagingController!.itemList![listViewIndex];
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
                                        '${listViewTranferHistoryListRecord.type} ${formatNumber(
                                          listViewTranferHistoryListRecord
                                              .credit,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                        )} บาท',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: () {
                                                if (listViewTranferHistoryListRecord
                                                        .status ==
                                                    0) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary;
                                                } else if (listViewTranferHistoryListRecord
                                                        .status ==
                                                    1) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .success;
                                                } else {
                                                  return Color(0x00000000);
                                                }
                                              }(),
                                              fontSize: 22.0,
                                            ),
                                      ),
                                      Text(
                                        '${dateTimeFormat('d/M/y', listViewTranferHistoryListRecord.createDate)} ${dateTimeFormat('Hm', listViewTranferHistoryListRecord.createDate)}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Text(
                                      () {
                                        if (listViewTranferHistoryListRecord
                                                .status ==
                                            0) {
                                          return 'ระบบกำลังประมวลผล';
                                        } else if (listViewTranferHistoryListRecord
                                                .status ==
                                            1) {
                                          return 'สำเร็จ';
                                        } else {
                                          return '-';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: () {
                                              if (listViewTranferHistoryListRecord
                                                      .status ==
                                                  0) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .tertiary;
                                              } else if (listViewTranferHistoryListRecord
                                                      .status ==
                                                  1) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .success;
                                              } else {
                                                return Color(0x00000000);
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
