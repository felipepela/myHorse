import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'cavalo_profissionais_add_widget.dart' show CavaloProfissionaisAddWidget;
import 'package:flutter/material.dart';

class CavaloProfissionaisAddModel
    extends FlutterFlowModel<CavaloProfissionaisAddWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDownField widget.
  String? dropDownFieldValue;
  FormFieldController<String>? dropDownFieldValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? profissionalSel;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
