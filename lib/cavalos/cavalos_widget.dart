import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/horses_list_row_widget.dart';
import '/components/novo_cavalo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'cavalos_model.dart';
export 'cavalos_model.dart';

class CavalosWidget extends StatefulWidget {
  const CavalosWidget({super.key});

  static String routeName = 'Cavalos';
  static String routePath = '/cavalos';

  @override
  State<CavalosWidget> createState() => _CavalosWidgetState();
}

class _CavalosWidgetState extends State<CavalosWidget> {
  late CavalosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CavalosModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Cavalos'});
    _model.campoBuscaTextController ??= TextEditingController();
    _model.campoBuscaFocusNode ??= FocusNode();

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
            logFirebaseEvent('CAVALOS_FloatingActionButton_xens7vzn_ON');
            logFirebaseEvent('FloatingActionButton_bottom_sheet');
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: NovoCavaloWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
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
              logFirebaseEvent('CAVALOS_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed(NewHomeWidget.routeName);
            },
          ),
          title: Text(
            'Cavalos',
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 0.0),
                          child: Container(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.campoBuscaTextController,
                              focusNode: _model.campoBuscaFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.campoBuscaTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  logFirebaseEvent(
                                      'CAVALOS_CampoBusca_ON_TEXTFIELD_CHANGE');
                                  logFirebaseEvent('CampoBusca_simple_search');
                                  await queryHorsesRecordOnce()
                                      .then(
                                        (records) => _model
                                            .simpleSearchResults = TextSearch(
                                          records
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [record.nome]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model
                                                .campoBuscaTextController.text)
                                            .map((r) => r.object)
                                            .toList(),
                                      )
                                      .onError((_, __) =>
                                          _model.simpleSearchResults = [])
                                      .whenComplete(() => safeSetState(() {}));
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.ebGaramond(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                hintText: 'Digite o nome do Cavalo',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.ebGaramond(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.ebGaramond(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              validator: _model
                                  .campoBuscaTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  final resultadoBusca =
                      _model.simpleSearchResults.map((e) => e).toList();

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(resultadoBusca.length,
                        (resultadoBuscaIndex) {
                      final resultadoBuscaItem =
                          resultadoBusca[resultadoBuscaIndex];
                      return ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          HorsesListRowWidget(
                            key: Key(
                                'Keyqig_${resultadoBuscaIndex}_of_${resultadoBusca.length}'),
                            parameter1: resultadoBuscaItem.foto,
                            parameter2: resultadoBuscaItem.nome,
                            parameter3: resultadoBuscaItem.priority,
                            parameter4: resultadoBuscaItem.reference,
                          ),
                        ],
                      );
                    }),
                  );
                },
              ),
              if ((_model.simpleSearchResults.isNotEmpty) == false)
                StreamBuilder<List<HorsesRecord>>(
                  stream: queryHorsesRecord(
                    queryBuilder: (horsesRecord) => horsesRecord.where(
                      'dono',
                      isEqualTo: currentUserReference,
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
                    List<HorsesRecord> resultadosHorsesRecordList =
                        snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(resultadosHorsesRecordList.length,
                          (resultadosIndex) {
                        final resultadosHorsesRecord =
                            resultadosHorsesRecordList[resultadosIndex];
                        return ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            HorsesListRowWidget(
                              key: Key(
                                  'Keynbr_${resultadosIndex}_of_${resultadosHorsesRecordList.length}'),
                              parameter1: resultadosHorsesRecord.foto,
                              parameter2: resultadosHorsesRecord.nome,
                              parameter3: resultadosHorsesRecord.priority,
                              parameter4: resultadosHorsesRecord.reference,
                            ),
                          ],
                        );
                      }),
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
