import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'novo_consulta_widget.dart' show NovoConsultaWidget;
import 'package:flutter/material.dart';

class NovoConsultaModel extends FlutterFlowModel<NovoConsultaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  DateTime? datePicked;
  // State field(s) for consultaField widget.
  FocusNode? consultaFieldFocusNode;
  TextEditingController? consultaFieldTextController;
  String? Function(BuildContext, String?)? consultaFieldTextControllerValidator;
  String? _consultaFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for resumoConsulta widget.
  FocusNode? resumoConsultaFocusNode;
  TextEditingController? resumoConsultaTextController;
  String? Function(BuildContext, String?)?
      resumoConsultaTextControllerValidator;
  String? _resumoConsultaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CavalosConsultasRecord? consultaID;

  @override
  void initState(BuildContext context) {
    consultaFieldTextControllerValidator =
        _consultaFieldTextControllerValidator;
    resumoConsultaTextControllerValidator =
        _resumoConsultaTextControllerValidator;
  }

  @override
  void dispose() {
    consultaFieldFocusNode?.dispose();
    consultaFieldTextController?.dispose();

    resumoConsultaFocusNode?.dispose();
    resumoConsultaTextController?.dispose();
  }
}
