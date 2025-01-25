import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cavalo_agenda_atividades_widget.dart' show CavaloAgendaAtividadesWidget;
import 'package:flutter/material.dart';

class CavaloAgendaAtividadesModel
    extends FlutterFlowModel<CavaloAgendaAtividadesWidget> {
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
