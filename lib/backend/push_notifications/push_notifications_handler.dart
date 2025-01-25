import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/splashscreen.png',
            fit: BoxFit.fitHeight,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Login': ParameterData.none(),
  'Profile': ParameterData.none(),
  'CavaloProfissionais': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'CavaloGaleria': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'CavaloDetalhe': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'CavaloDocumentos': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'CavaloProfissionaisAdd': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
          'profissionalSelecionado':
              getParameter<String>(data, 'profissionalSelecionado'),
        },
      ),
  'CavaloAtividades': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'CavaloAgendaConsultas': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'Cavalos': ParameterData.none(),
  'AuthUpdate': ParameterData.none(),
  'CavaloDetalheVeterinario': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'CavaloConsultasMedicacoes': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'ProfileVet': ParameterData.none(),
  'ProfileTratador': ParameterData.none(),
  'CavaloDetalheTratador': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'CavaloDetalheAtividade': (data) async => ParameterData(
        allParams: {
          'atividadeID': getParameter<DocumentReference>(data, 'atividadeID'),
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'CavaloAgendaAtividades': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'ProfileTecnico': ParameterData.none(),
  'CavaloDetalheTecnico': (data) async => ParameterData(
        allParams: {
          'cavvalo': getParameter<DocumentReference>(data, 'cavvalo'),
        },
      ),
  'CavaloAtividadesTecnico': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'CavaloAgendaConsultasTcnico': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'CavaloAgendaAtividadesTecnico': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'NewHome': ParameterData.none(),
  'HomeVeterinario': ParameterData.none(),
  'HomeTratador': ParameterData.none(),
  'HomeTecnico': ParameterData.none(),
  'AgendaGeral': ParameterData.none(),
  'CavaloCompeticoes': (data) async => ParameterData(
        allParams: {
          'cavalo': getParameter<DocumentReference>(data, 'cavalo'),
        },
      ),
  'HistoricoClinico': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
