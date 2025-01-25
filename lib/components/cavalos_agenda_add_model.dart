import '/flutter_flow/flutter_flow_util.dart';
import 'cavalos_agenda_add_widget.dart' show CavalosAgendaAddWidget;
import 'package:flutter/material.dart';

class CavalosAgendaAddModel extends FlutterFlowModel<CavalosAgendaAddWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
