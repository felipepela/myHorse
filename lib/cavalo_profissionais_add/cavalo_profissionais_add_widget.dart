import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'cavalo_profissionais_add_model.dart';
export 'cavalo_profissionais_add_model.dart';

class CavaloProfissionaisAddWidget extends StatefulWidget {
  const CavaloProfissionaisAddWidget({
    super.key,
    required this.cavalo,
    String? profissionalSelecionado,
  }) : profissionalSelecionado = profissionalSelecionado ?? '';

  final DocumentReference? cavalo;
  final String profissionalSelecionado;

  @override
  State<CavaloProfissionaisAddWidget> createState() =>
      _CavaloProfissionaisAddWidgetState();
}

class _CavaloProfissionaisAddWidgetState
    extends State<CavaloProfissionaisAddWidget> {
  late CavaloProfissionaisAddModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CavaloProfissionaisAddModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CavaloProfissionaisAdd'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CavalosProfissionaisRecord>>(
      stream: queryCavalosProfissionaisRecord(
        queryBuilder: (cavalosProfissionaisRecord) =>
            cavalosProfissionaisRecord.where(
          'cavalo',
          isEqualTo: widget.cavalo,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFFBAAD72),
                  ),
                ),
              ),
            ),
          );
        }
        List<CavalosProfissionaisRecord>
            cavaloProfissionaisAddCavalosProfissionaisRecordList =
            snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                logFirebaseEvent('CAVALO_PROFISSIONAIS_ADD_arrow_back_roun');
                logFirebaseEvent('IconButton_navigate_back');
                context.safePop();
              },
            ),
            title: Text(
              'Profissionais',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'EB Garamond',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Ao escolher um profissional, ele poderá ter acesso as informações do seu cavalo, inserir consultas, tratamentos e atividades. ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'EB Garamond',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'role',
                                    isGreaterThan: 1,
                                  ),
                                  limit: 100,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFFBAAD72),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRecord>
                                      dropDownFieldUsersRecordList =
                                      snapshot.data!;

                                  return FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownFieldValueController ??=
                                            FormFieldController<String>(null),
                                    options: dropDownFieldUsersRecordList
                                        .map((e) => valueOrDefault<String>(
                                              e.email,
                                              '-',
                                            ))
                                        .toList(),
                                    onChanged: (val) => safeSetState(
                                        () => _model.dropDownFieldValue = val),
                                    width: 374.0,
                                    height: 60.0,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'EB Garamond',
                                              letterSpacing: 0.0,
                                            ),
                                    searchTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'EB Garamond',
                                              letterSpacing: 0.0,
                                            ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'EB Garamond',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Selecione o Profissional',
                                    searchHintText: 'Buscar',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              _model.dropDownFieldValue,
                              '-',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'EB Garamond',
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CAVALO_PROFISSIONAIS_ADD_VINCULAR_PROFIS');
                                var shouldSetState = false;
                                if (!(_model.dropDownFieldValue != null &&
                                    _model.dropDownFieldValue != '')) {
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }
                                logFirebaseEvent('Button_firestore_query');
                                _model.profissionalSel =
                                    await queryUsersRecordOnce(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'email',
                                    isEqualTo: _model.dropDownFieldValue,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                shouldSetState = true;
                                logFirebaseEvent('Button_backend_call');

                                await CavalosProfissionaisRecord.collection
                                    .doc()
                                    .set(createCavalosProfissionaisRecordData(
                                      nome: _model.profissionalSel?.displayName,
                                      foto: _model.profissionalSel?.photoUrl,
                                      type: _model.profissionalSel?.type,
                                      cavalo: widget.cavalo,
                                      profissional:
                                          _model.profissionalSel?.reference,
                                    ));
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Sucesso'),
                                      content: const Text(
                                          'Profissional Vinculado com Sucesso'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'CavaloProfissionais',
                                  queryParameters: {
                                    'cavalo': serializeParam(
                                      widget.cavalo,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );

                                if (shouldSetState) safeSetState(() {});
                              },
                              text: 'Vincular Profissional',
                              options: FFButtonOptions(
                                height: 61.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 10.0, 30.0, 10.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF041E3A),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'EB Garamond',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
