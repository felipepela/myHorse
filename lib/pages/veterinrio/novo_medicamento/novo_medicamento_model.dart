import '/flutter_flow/flutter_flow_util.dart';
import 'novo_medicamento_widget.dart' show NovoMedicamentoWidget;
import 'package:flutter/material.dart';

class NovoMedicamentoModel extends FlutterFlowModel<NovoMedicamentoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NomeMedicamento widget.
  FocusNode? nomeMedicamentoFocusNode;
  TextEditingController? nomeMedicamentoTextController;
  String? Function(BuildContext, String?)?
      nomeMedicamentoTextControllerValidator;
  String? _nomeMedicamentoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for modo_de_usar widget.
  FocusNode? modoDeUsarFocusNode;
  TextEditingController? modoDeUsarTextController;
  String? Function(BuildContext, String?)? modoDeUsarTextControllerValidator;
  String? _modoDeUsarTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nomeMedicamentoTextControllerValidator =
        _nomeMedicamentoTextControllerValidator;
    modoDeUsarTextControllerValidator = _modoDeUsarTextControllerValidator;
  }

  @override
  void dispose() {
    nomeMedicamentoFocusNode?.dispose();
    nomeMedicamentoTextController?.dispose();

    modoDeUsarFocusNode?.dispose();
    modoDeUsarTextController?.dispose();
  }
}
