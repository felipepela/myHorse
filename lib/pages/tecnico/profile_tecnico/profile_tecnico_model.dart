import '/flutter_flow/flutter_flow_util.dart';
import 'profile_tecnico_widget.dart' show ProfileTecnicoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileTecnicoModel extends FlutterFlowModel<ProfileTecnicoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Nome_Field widget.
  FocusNode? nomeFieldFocusNode;
  TextEditingController? nomeFieldTextController;
  String? Function(BuildContext, String?)? nomeFieldTextControllerValidator;
  String? _nomeFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for Telefone_Field widget.
  FocusNode? telefoneFieldFocusNode;
  TextEditingController? telefoneFieldTextController;
  final telefoneFieldMask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? telefoneFieldTextControllerValidator;
  String? _telefoneFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for CEP_Field widget.
  FocusNode? cEPFieldFocusNode;
  TextEditingController? cEPFieldTextController;
  final cEPFieldMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? cEPFieldTextControllerValidator;
  String? _cEPFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nomeFieldTextControllerValidator = _nomeFieldTextControllerValidator;
    telefoneFieldTextControllerValidator =
        _telefoneFieldTextControllerValidator;
    cEPFieldTextControllerValidator = _cEPFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nomeFieldFocusNode?.dispose();
    nomeFieldTextController?.dispose();

    telefoneFieldFocusNode?.dispose();
    telefoneFieldTextController?.dispose();

    cEPFieldFocusNode?.dispose();
    cEPFieldTextController?.dispose();
  }
}
