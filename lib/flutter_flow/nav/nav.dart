import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Profile')
              : ProfileWidget(),
        ),
        FFRoute(
          name: CavaloProfissionaisWidget.routeName,
          path: CavaloProfissionaisWidget.routePath,
          builder: (context, params) => CavaloProfissionaisWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloGaleriaWidget.routeName,
          path: CavaloGaleriaWidget.routePath,
          builder: (context, params) => CavaloGaleriaWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloDetalheWidget.routeName,
          path: CavaloDetalheWidget.routePath,
          builder: (context, params) => CavaloDetalheWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloDocumentosWidget.routeName,
          path: CavaloDocumentosWidget.routePath,
          builder: (context, params) => CavaloDocumentosWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloProfissionaisAddWidget.routeName,
          path: CavaloProfissionaisAddWidget.routePath,
          builder: (context, params) => CavaloProfissionaisAddWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
            profissionalSelecionado: params.getParam(
              'profissionalSelecionado',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CavaloAtividadesWidget.routeName,
          path: CavaloAtividadesWidget.routePath,
          builder: (context, params) => CavaloAtividadesWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloAgendaConsultasWidget.routeName,
          path: CavaloAgendaConsultasWidget.routePath,
          builder: (context, params) => CavaloAgendaConsultasWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavalosWidget.routeName,
          path: CavalosWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Cavalos')
              : CavalosWidget(),
        ),
        FFRoute(
          name: AuthUpdateWidget.routeName,
          path: AuthUpdateWidget.routePath,
          builder: (context, params) => AuthUpdateWidget(),
        ),
        FFRoute(
          name: CavaloDetalheVeterinarioWidget.routeName,
          path: CavaloDetalheVeterinarioWidget.routePath,
          builder: (context, params) => CavaloDetalheVeterinarioWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloConsultasMedicacoesWidget.routeName,
          path: CavaloConsultasMedicacoesWidget.routePath,
          builder: (context, params) => CavaloConsultasMedicacoesWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: ProfileVetWidget.routeName,
          path: ProfileVetWidget.routePath,
          builder: (context, params) => ProfileVetWidget(),
        ),
        FFRoute(
          name: ProfileTratadorWidget.routeName,
          path: ProfileTratadorWidget.routePath,
          builder: (context, params) => ProfileTratadorWidget(),
        ),
        FFRoute(
          name: CavaloDetalheTratadorWidget.routeName,
          path: CavaloDetalheTratadorWidget.routePath,
          builder: (context, params) => CavaloDetalheTratadorWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloDetalheAtividadeWidget.routeName,
          path: CavaloDetalheAtividadeWidget.routePath,
          builder: (context, params) => CavaloDetalheAtividadeWidget(
            atividadeID: params.getParam(
              'atividadeID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cavalos_atividades'],
            ),
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloAgendaAtividadesWidget.routeName,
          path: CavaloAgendaAtividadesWidget.routePath,
          builder: (context, params) => CavaloAgendaAtividadesWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: ProfileTecnicoWidget.routeName,
          path: ProfileTecnicoWidget.routePath,
          builder: (context, params) => ProfileTecnicoWidget(),
        ),
        FFRoute(
          name: CavaloDetalheTecnicoWidget.routeName,
          path: CavaloDetalheTecnicoWidget.routePath,
          builder: (context, params) => CavaloDetalheTecnicoWidget(
            cavvalo: params.getParam(
              'cavvalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloAtividadesTecnicoWidget.routeName,
          path: CavaloAtividadesTecnicoWidget.routePath,
          builder: (context, params) => CavaloAtividadesTecnicoWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloAgendaConsultasTcnicoWidget.routeName,
          path: CavaloAgendaConsultasTcnicoWidget.routePath,
          builder: (context, params) => CavaloAgendaConsultasTcnicoWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: CavaloAgendaAtividadesTecnicoWidget.routeName,
          path: CavaloAgendaAtividadesTecnicoWidget.routePath,
          builder: (context, params) => CavaloAgendaAtividadesTecnicoWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: NewHomeWidget.routeName,
          path: NewHomeWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'NewHome')
              : NewHomeWidget(),
        ),
        FFRoute(
          name: HomeVeterinarioWidget.routeName,
          path: HomeVeterinarioWidget.routePath,
          builder: (context, params) => HomeVeterinarioWidget(),
        ),
        FFRoute(
          name: HomeTratadorWidget.routeName,
          path: HomeTratadorWidget.routePath,
          builder: (context, params) => HomeTratadorWidget(),
        ),
        FFRoute(
          name: HomeTecnicoWidget.routeName,
          path: HomeTecnicoWidget.routePath,
          builder: (context, params) => HomeTecnicoWidget(),
        ),
        FFRoute(
          name: AgendaGeralWidget.routeName,
          path: AgendaGeralWidget.routePath,
          builder: (context, params) => AgendaGeralWidget(),
        ),
        FFRoute(
          name: CavaloCompeticoesWidget.routeName,
          path: CavaloCompeticoesWidget.routePath,
          builder: (context, params) => CavaloCompeticoesWidget(
            cavalo: params.getParam(
              'cavalo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['horses'],
            ),
          ),
        ),
        FFRoute(
          name: HistoricoClinicoWidget.routeName,
          path: HistoricoClinicoWidget.routePath,
          builder: (context, params) => HistoricoClinicoWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/splashscreen.png',
                    fit: BoxFit.fitHeight,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
