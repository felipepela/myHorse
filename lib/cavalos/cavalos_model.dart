import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cavalos_widget.dart' show CavalosWidget;
import 'package:flutter/material.dart';

class CavalosModel extends FlutterFlowModel<CavalosWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CampoBusca widget.
  FocusNode? campoBuscaFocusNode;
  TextEditingController? campoBuscaTextController;
  String? Function(BuildContext, String?)? campoBuscaTextControllerValidator;
  List<HorsesRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    campoBuscaFocusNode?.dispose();
    campoBuscaTextController?.dispose();
  }
}
