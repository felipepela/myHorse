import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'auth_update_model.dart';
export 'auth_update_model.dart';

class AuthUpdateWidget extends StatefulWidget {
  const AuthUpdateWidget({super.key});

  @override
  State<AuthUpdateWidget> createState() => _AuthUpdateWidgetState();
}

class _AuthUpdateWidgetState extends State<AuthUpdateWidget> {
  late AuthUpdateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthUpdateModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AuthUpdate'});
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
              logFirebaseEvent('AUTH_UPDATE_arrow_back_rounded_ICN_ON_TA');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed('NewHome');
            },
          ),
          title: Text(
            'Perfil do Usuário',
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SafeArea(
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 20.0, 8.0, 20.0),
                          child: AutoSizeText(
                            'Você pode utilizar nosso aplicativo para fazer a gestão dos seus animas ou como um profissional que atende ao público. ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'EB Garamond',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.selecionePerfilValueController ??=
                                          FormFieldController<String>(null),
                                  options: const [
                                    'Proprietário de Cavalo',
                                    'Veterinário',
                                    'Responsável Técnico',
                                    'Tratador'
                                  ],
                                  onChanged: (val) => safeSetState(
                                      () => _model.selecionePerfilValue = val),
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'EB Garamond',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Selecione o Perfil',
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
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100.0,
                                  height: 113.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 20.0, 8.0, 20.0),
                                    child: Text(
                                      'Caso você faça parte de dois perfis, um veterinário e propriertário de cavalos, você precisa fazer 2 logins diferentes.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'EB Garamond',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('AUTH_UPDATE_PAGE_Modificar_ON_TAP');
                    if (_model.selecionePerfilValue == '0') {
                      logFirebaseEvent('Modificar_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Alerta'),
                            content: const Text('Você precisa selecionar um perfil!'),
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
                      return;
                    }
                    if (_model.selecionePerfilValue ==
                        'Proprietário de Cavalo') {
                      logFirebaseEvent('Modificar_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        role: 1,
                        type: _model.selecionePerfilValue,
                      ));
                      logFirebaseEvent('Modificar_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Sucesso'),
                            content: const Text(
                                'Seu cadastor como Proprietário foi Concluido.'),
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
                      logFirebaseEvent('Modificar_navigate_to');

                      context.pushNamed('NewHome');
                    } else {
                      logFirebaseEvent('Modificar_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        role: 2,
                        type: _model.selecionePerfilValue,
                      ));
                      logFirebaseEvent('Modificar_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Sucesso'),
                            content: const Text(
                                'Seu cadastro foi criado como Prestador de Serviço,'),
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
                      if (valueOrDefault(currentUserDocument?.type, '') ==
                          'Tratador') {
                        logFirebaseEvent('Modificar_navigate_to');

                        context.pushNamed('HomeTratador');
                      } else {
                        if (valueOrDefault(currentUserDocument?.type, '') ==
                            'Responsável Técnico') {
                          logFirebaseEvent('Modificar_navigate_to');

                          context.pushNamed('HomeTecnico');
                        } else {
                          logFirebaseEvent('Modificar_navigate_to');

                          context.pushNamed('HomeVeterinario');
                        }
                      }
                    }
                  },
                  text: 'Concluir o Cadastro',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.95,
                    height: 51.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 10.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFFBAAD72),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'EB Garamond',
                          color: Colors.white,
                          fontSize: 22.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
