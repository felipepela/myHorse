import '/flutter_flow/flutter_flow_util.dart';
import 'view_medicamento_widget.dart' show ViewMedicamentoWidget;
import 'package:flutter/material.dart';

class ViewMedicamentoModel extends FlutterFlowModel<ViewMedicamentoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NomeMedicamento widget.
  FocusNode? nomeMedicamentoFocusNode;
  TextEditingController? nomeMedicamentoTextController;
  String? Function(BuildContext, String?)?
      nomeMedicamentoTextControllerValidator;
  // State field(s) for modo_de_usar widget.
  FocusNode? modoDeUsarFocusNode;
  TextEditingController? modoDeUsarTextController;
  String? Function(BuildContext, String?)? modoDeUsarTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeMedicamentoFocusNode?.dispose();
    nomeMedicamentoTextController?.dispose();

    modoDeUsarFocusNode?.dispose();
    modoDeUsarTextController?.dispose();
  }
}
