import '/flutter_flow/flutter_flow_util.dart';
import 'nova_atividade_widget.dart' show NovaAtividadeWidget;
import 'package:flutter/material.dart';

class NovaAtividadeModel extends FlutterFlowModel<NovaAtividadeWidget> {
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

  // State field(s) for frequenciaField widget.
  FocusNode? frequenciaFieldFocusNode;
  TextEditingController? frequenciaFieldTextController;
  String? Function(BuildContext, String?)?
      frequenciaFieldTextControllerValidator;
  String? _frequenciaFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for periodo widget.
  FocusNode? periodoFocusNode;
  TextEditingController? periodoTextController;
  String? Function(BuildContext, String?)? periodoTextControllerValidator;
  String? _periodoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {
    atividadeTextControllerValidator = _atividadeTextControllerValidator;
    frequenciaFieldTextControllerValidator =
        _frequenciaFieldTextControllerValidator;
    periodoTextControllerValidator = _periodoTextControllerValidator;
  }

  @override
  void dispose() {
    atividadeFocusNode?.dispose();
    atividadeTextController?.dispose();

    frequenciaFieldFocusNode?.dispose();
    frequenciaFieldTextController?.dispose();

    periodoFocusNode?.dispose();
    periodoTextController?.dispose();
  }
}
