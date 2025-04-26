import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'novo_cavalo_widget.dart' show NovoCavaloWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NovoCavaloModel extends FlutterFlowModel<NovoCavaloWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  String? _nomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for dataNascimento widget.
  FocusNode? dataNascimentoFocusNode;
  TextEditingController? dataNascimentoTextController;
  final dataNascimentoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      dataNascimentoTextControllerValidator;
  String? _dataNascimentoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for raca widget.
  FocusNode? racaFocusNode;
  TextEditingController? racaTextController;
  String? Function(BuildContext, String?)? racaTextControllerValidator;
  String? _racaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for Pelagem widget.
  FocusNode? pelagemFocusNode;
  TextEditingController? pelagemTextController;
  String? Function(BuildContext, String?)? pelagemTextControllerValidator;
  String? _pelagemTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for studbook widget.
  FocusNode? studbookFocusNode;
  TextEditingController? studbookTextController;
  String? Function(BuildContext, String?)? studbookTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in studbook widget.
  HorsesRecord? horses;
  // State field(s) for peso widget.
  FocusNode? pesoFocusNode;
  TextEditingController? pesoTextController;
  String? Function(BuildContext, String?)? pesoTextControllerValidator;
  String? _pesoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for altura widget.
  FocusNode? alturaFocusNode;
  TextEditingController? alturaTextController;
  String? Function(BuildContext, String?)? alturaTextControllerValidator;
  String? _alturaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nomeTextControllerValidator = _nomeTextControllerValidator;
    dataNascimentoTextControllerValidator =
        _dataNascimentoTextControllerValidator;
    racaTextControllerValidator = _racaTextControllerValidator;
    pelagemTextControllerValidator = _pelagemTextControllerValidator;
    pesoTextControllerValidator = _pesoTextControllerValidator;
    alturaTextControllerValidator = _alturaTextControllerValidator;
  }

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    dataNascimentoFocusNode?.dispose();
    dataNascimentoTextController?.dispose();

    racaFocusNode?.dispose();
    racaTextController?.dispose();

    pelagemFocusNode?.dispose();
    pelagemTextController?.dispose();

    studbookFocusNode?.dispose();
    studbookTextController?.dispose();

    pesoFocusNode?.dispose();
    pesoTextController?.dispose();

    alturaFocusNode?.dispose();
    alturaTextController?.dispose();
  }
}
