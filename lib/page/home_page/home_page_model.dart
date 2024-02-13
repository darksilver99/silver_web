import '/component/nav_menu_view/nav_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavMenuView component.
  late NavMenuViewModel navMenuViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navMenuViewModel = createModel(context, () => NavMenuViewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navMenuViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
