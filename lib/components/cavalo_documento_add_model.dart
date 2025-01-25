import '/flutter_flow/flutter_flow_util.dart';
import 'cavalo_documento_add_widget.dart' show CavaloDocumentoAddWidget;
import 'package:flutter/material.dart';

class CavaloDocumentoAddModel
    extends FlutterFlowModel<CavaloDocumentoAddWidget> {
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

  @override
  void initState(BuildContext context) {
    nomeFieldTextControllerValidator = _nomeFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nomeFieldFocusNode?.dispose();
    nomeFieldTextController?.dispose();
  }
}
