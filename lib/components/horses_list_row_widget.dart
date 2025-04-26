import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'horses_list_row_model.dart';
export 'horses_list_row_model.dart';

class HorsesListRowWidget extends StatefulWidget {
  const HorsesListRowWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final String? parameter1;
  final String? parameter2;
  final bool? parameter3;
  final DocumentReference? parameter4;

  @override
  State<HorsesListRowWidget> createState() => _HorsesListRowWidgetState();
}

class _HorsesListRowWidgetState extends State<HorsesListRowWidget> {
  late HorsesListRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HorsesListRowModel());

    _model.switchValue = widget.parameter3!;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('HORSES_LIST_ROW_COMP_Row_sovq6buy_ON_TAP');
          logFirebaseEvent('Row_navigate_to');

          context.pushNamed(
            CavaloDetalheWidget.routeName,
            queryParameters: {
              'cavalo': serializeParam(
                widget.parameter4,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.parameter1!,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              widget.parameter2!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.ebGaramond(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Switch.adaptive(
              value: _model.switchValue!,
              onChanged: (newValue) async {
                safeSetState(() => _model.switchValue = newValue);
                if (newValue) {
                  logFirebaseEvent('HORSES_LIST_ROW_Switch_r3sqkzu9_ON_TOGGL');
                  logFirebaseEvent('Switch_backend_call');

                  await widget.parameter4!.update(createHorsesRecordData(
                    priority: true,
                  ));
                } else {
                  logFirebaseEvent('HORSES_LIST_ROW_Switch_r3sqkzu9_ON_TOGGL');
                  logFirebaseEvent('Switch_backend_call');

                  await widget.parameter4!.update(createHorsesRecordData(
                    priority: false,
                  ));
                }
              },
              activeColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).primary,
              inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
              inactiveThumbColor:
                  FlutterFlowTheme.of(context).secondaryBackground,
            ),
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              fillColor: Color(0xFFB0000A),
              icon: Icon(
                Icons.delete_outline,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('HORSES_LIST_ROW_delete_outline_ICN_ON_TA');
                logFirebaseEvent('IconButton_alert_dialog');
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Removendo Cavalo'),
                          content:
                              Text('Essa ação é irreversivel, tem certeza?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: Text('Não'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: Text('Sim, pode remover o cavalo.'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  logFirebaseEvent('IconButton_backend_call');
                  await widget.parameter4!.delete();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
