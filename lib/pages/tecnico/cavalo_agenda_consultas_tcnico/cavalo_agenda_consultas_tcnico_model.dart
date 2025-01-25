import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cavalo_agenda_consultas_tcnico_widget.dart'
    show CavaloAgendaConsultasTcnicoWidget;
import 'package:flutter/material.dart';

class CavaloAgendaConsultasTcnicoModel
    extends FlutterFlowModel<CavaloAgendaConsultasTcnicoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
