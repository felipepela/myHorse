import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cavalo_profissionais_model.dart';
export 'cavalo_profissionais_model.dart';

class CavaloProfissionaisWidget extends StatefulWidget {
  const CavaloProfissionaisWidget({
    super.key,
    required this.cavalo,
  });

  final DocumentReference? cavalo;

  static String routeName = 'CavaloProfissionais';
  static String routePath = '/cavaloProfissionais';

  @override
  State<CavaloProfissionaisWidget> createState() =>
      _CavaloProfissionaisWidgetState();
}

class _CavaloProfissionaisWidgetState extends State<CavaloProfissionaisWidget> {
  late CavaloProfissionaisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CavaloProfissionaisModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CavaloProfissionais'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            logFirebaseEvent('CAVALO_PROFISSIONAIS_FloatingActionButto');
            logFirebaseEvent('FloatingActionButton_navigate_to');

            context.pushNamed(
              CavaloProfissionaisAddWidget.routeName,
              queryParameters: {
                'cavalo': serializeParam(
                  widget.cavalo,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CAVALO_PROFISSIONAIS_arrow_back_rounded_');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed(
                CavaloDetalheWidget.routeName,
                queryParameters: {
                  'cavalo': serializeParam(
                    widget.cavalo,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );
            },
          ),
          title: Text(
            'Profissionais',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.ebGaramond(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<CavalosProfissionaisRecord>>(
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
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFBAAD72),
                          ),
                        ),
                      ),
                    );
                  }
                  List<CavalosProfissionaisRecord>
                      listViewCavalosProfissionaisRecordList = snapshot.data!;
                  if (listViewCavalosProfissionaisRecordList.isEmpty) {
                    return Image.asset(
                      'assets/images/PROFISSIOANISVIUNCULADOS.png',
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewCavalosProfissionaisRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewCavalosProfissionaisRecord =
                          listViewCavalosProfissionaisRecordList[listViewIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            listViewCavalosProfissionaisRecord
                                                .profissional!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Color(0xFFBAAD72),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final imageUsersRecord =
                                              snapshot.data!;

                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              imageUsersRecord.photoUrl,
                                              width: 80.0,
                                              height: 80.0,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: 80.0,
                                                height: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listViewCavalosProfissionaisRecord.nome
                                          .maybeHandleOverflow(
                                        maxChars: 15,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.ebGaramond(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          listViewCavalosProfissionaisRecord
                                              .profissional!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFBAAD72),
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final textUsersRecord = snapshot.data!;

                                        return Text(
                                          textUsersRecord.email
                                              .maybeHandleOverflow(
                                            maxChars: 25,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.ebGaramond(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        );
                                      },
                                    ),
                                    Text(
                                      listViewCavalosProfissionaisRecord.type
                                          .maybeHandleOverflow(
                                        maxChars: 15,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.ebGaramond(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
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
                                logFirebaseEvent(
                                    'CAVALO_PROFISSIONAIS_delete_outline_ICN_');
                                logFirebaseEvent('IconButton_alert_dialog');
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Certeza?'),
                                              content: Text(
                                                  'Deseja remove o vinculo do profissional?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Não'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Sim'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent('IconButton_backend_call');
                                  await listViewCavalosProfissionaisRecord
                                      .reference
                                      .delete();
                                }
                                logFirebaseEvent('IconButton_navigate_to');

                                context.pushNamed(
                                  CavaloProfissionaisWidget.routeName,
                                  queryParameters: {
                                    'cavalo': serializeParam(
                                      widget.cavalo,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
