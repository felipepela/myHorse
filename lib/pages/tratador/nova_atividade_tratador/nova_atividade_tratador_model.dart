import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nova_atividade_tratador_widget.dart' show NovaAtividadeTratadorWidget;
import 'package:flutter/material.dart';

class NovaAtividadeTratadorModel
    extends FlutterFlowModel<NovaAtividadeTratadorWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for atividade widget.
  FocusNode? atividadeFocusNode;
  TextEditingController? atividadeTextController;
  String? Function(BuildContext, String?)? atividadeTextControllerValidator;
  String? _atividadeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for descricaoField widget.
  FocusNode? descricaoFieldFocusNode;
  TextEditingController? descricaoFieldTextController;
  String? Function(BuildContext, String?)?
      descricaoFieldTextControllerValidator;
  String? _descricaoFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CavalosAtividadesRecord? atividadeRef;

  @override
  void initState(BuildContext context) {
    atividadeTextControllerValidator = _atividadeTextControllerValidator;
    descricaoFieldTextControllerValidator =
        _descricaoFieldTextControllerValidator;
  }

  @override
  void dispose() {
    atividadeFocusNode?.dispose();
    atividadeTextController?.dispose();

    descricaoFieldFocusNode?.dispose();
    descricaoFieldTextController?.dispose();
  }
}
