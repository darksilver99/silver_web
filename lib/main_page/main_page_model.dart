import '/auth/firebase_auth/auth_util.dart';
import '/components/select_credit_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/view/history_tranfer_view/history_tranfer_view_widget.dart';
import '/view/home_view/home_view_widget.dart';
import '/view/order_view/order_view_widget.dart';
import '/view/withdraw_view/withdraw_view_widget.dart';
import 'main_page_widget.dart' show MainPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPageModel extends FlutterFlowModel<MainPageWidget> {
  ///  Local state fields for this page.

  String pageView = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HomeView component.
  late HomeViewModel homeViewModel;
  // Model for WithdrawView component.
  late WithdrawViewModel withdrawViewModel;
  // Model for HistoryTranferView component.
  late HistoryTranferViewModel historyTranferViewModel;
  // Model for OrderView component.
  late OrderViewModel orderViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeViewModel = createModel(context, () => HomeViewModel());
    withdrawViewModel = createModel(context, () => WithdrawViewModel());
    historyTranferViewModel =
        createModel(context, () => HistoryTranferViewModel());
    orderViewModel = createModel(context, () => OrderViewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    homeViewModel.dispose();
    withdrawViewModel.dispose();
    historyTranferViewModel.dispose();
    orderViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
