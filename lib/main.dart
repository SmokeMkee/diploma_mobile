import 'package:diploma_mobile/src/features/init/dependencies_provider/dependencies_provider.dart';
import 'package:diploma_mobile/src/features/localization/i_locale_repo.dart';
import 'package:diploma_mobile/src/features/navigation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  return runApp(
    DependenciesProvider(
      builder: (context) {
        return InheritedProvider<AppRouter>(
          create: (context) => AppRouter(
            GlobalKey<NavigatorState>(),
          ),
          child: ValueListenableBuilder<Locale>(
            valueListenable: context.read<ILocaleRepo>().locale,
            builder: (context, locale, _) {
              return MaterialApp.router(
                routerDelegate: context.read<AppRouter>().delegate(),
                routeInformationParser: context.read<AppRouter>().defaultRouteParser(),
                scaffoldMessengerKey: scaffoldMessengerKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: locale,
                supportedLocales: S.delegate.supportedLocales,
                title: 'simpleeducation',

              );
            },
          ),
        );
      },
    ),
  );
}
