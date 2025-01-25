import '/flutter_flow/flutter_flow_util.dart';
import 'modificar_cavalo_widget.dart' show ModificarCavaloWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ModificarCavaloModel extends FlutterFlowModel<ModificarCavaloWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nomeField widget.
  FocusNode? nomeFieldFocusNode;
  TextEditingController? nomeFieldTextController;
  String? Function(BuildContext, String?)? nomeFieldTextControllerValidator;
  String? _nomeFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for dataNascimentoField widget.
  FocusNode? dataNascimentoFieldFocusNode;
  TextEditingController? dataNascimentoFieldTextController;
  final dataNascimentoFieldMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      dataNascimentoFieldTextControllerValidator;
  String? _dataNascimentoFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for racaField widget.
  FocusNode? racaFieldFocusNode;
  TextEditingController? racaFieldTextController;
  String? Function(BuildContext, String?)? racaFieldTextControllerValidator;
  String? _racaFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for PelagemField widget.
  FocusNode? pelagemFieldFocusNode;
  TextEditingController? pelagemFieldTextController;
  String? Function(BuildContext, String?)? pelagemFieldTextControllerValidator;
  String? _pelagemFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for studbookField widget.
  FocusNode? studbookFieldFocusNode;
  TextEditingController? studbookFieldTextController;
  String? Function(BuildContext, String?)? studbookFieldTextControllerValidator;
  // State field(s) for pesoField widget.
  FocusNode? pesoFieldFocusNode;
  TextEditingController? pesoFieldTextController;
  String? Function(BuildContext, String?)? pesoFieldTextControllerValidator;
  String? _pesoFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for alturaField widget.
  FocusNode? alturaFieldFocusNode;
  TextEditingController? alturaFieldTextController;
  String? Function(BuildContext, String?)? alturaFieldTextControllerValidator;
  String? _alturaFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nomeFieldTextControllerValidator = _nomeFieldTextControllerValidator;
    dataNascimentoFieldTextControllerValidator =
        _dataNascimentoFieldTextControllerValidator;
    racaFieldTextControllerValidator = _racaFieldTextControllerValidator;
    pelagemFieldTextControllerValidator = _pelagemFieldTextControllerValidator;
    pesoFieldTextControllerValidator = _pesoFieldTextControllerValidator;
    alturaFieldTextControllerValidator = _alturaFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nomeFieldFocusNode?.dispose();
    nomeFieldTextController?.dispose();

    dataNascimentoFieldFocusNode?.dispose();
    dataNascimentoFieldTextController?.dispose();

    racaFieldFocusNode?.dispose();
    racaFieldTextController?.dispose();

    pelagemFieldFocusNode?.dispose();
    pelagemFieldTextController?.dispose();

    studbookFieldFocusNode?.dispose();
    studbookFieldTextController?.dispose();

    pesoFieldFocusNode?.dispose();
    pesoFieldTextController?.dispose();

    alturaFieldFocusNode?.dispose();
    alturaFieldTextController?.dispose();
  }
}
