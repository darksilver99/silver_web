import '/components/home_view_widget.dart';
import '/components/setting_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/view/login_view/login_view_widget.dart';
import 'main_page_widget.dart' show MainPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPageModel extends FlutterFlowModel<MainPageWidget> {
  ///  Local state fields for this page.

  String pageView = 'homeView';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HomeView component.
  late HomeViewModel homeViewModel;
  // Model for SettingView component.
  late SettingViewModel settingViewModel;
  // Model for LoginView component.
  late LoginViewModel loginViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeViewModel = createModel(context, () => HomeViewModel());
    settingViewModel = createModel(context, () => SettingViewModel());
    loginViewModel = createModel(context, () => LoginViewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    homeViewModel.dispose();
    settingViewModel.dispose();
    loginViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
