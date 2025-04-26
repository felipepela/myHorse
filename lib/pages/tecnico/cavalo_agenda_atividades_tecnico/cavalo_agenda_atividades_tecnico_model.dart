import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cavalo_agenda_atividades_tecnico_widget.dart'
    show CavaloAgendaAtividadesTecnicoWidget;
import 'package:flutter/material.dart';

class CavaloAgendaAtividadesTecnicoModel
    extends FlutterFlowModel<CavaloAgendaAtividadesTecnicoWidget> {
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
