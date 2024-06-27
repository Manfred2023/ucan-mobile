import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/app/config/constant.dart';
import 'package:ucan/app/navigation/route.dart';
import 'package:ucan/app/navigation/route/app_route.dart';
import 'package:ucan/screen/shared/animate/smart_animate_page_transitions_builder.dart';
import 'package:ucan/utils/helpers/g.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
          primarySwatch: G.createMaterialColor(ColorsApp.primary),
          primaryColor: ColorsApp.primary,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: SmartAnimatePageTransitionsBuilder(),
              TargetPlatform.iOS: SmartAnimatePageTransitionsBuilder(),
            },
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorsApp.primary,
            selectionHandleColor: ColorsApp.primary,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            focusColor: Colors.grey,
            hoverColor: ColorsApp.primary,
            labelStyle: TextStyle(fontSize: 14, color: Colors.black45),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorsApp.primary,
              ),
            ),
          ),
          checkboxTheme: const CheckboxThemeData(
              side: BorderSide(color: ColorsApp.secondary)),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: ColorsApp.onSecondary),
            iconTheme: IconThemeData(color: ColorsApp.onSecondary),
            backgroundColor: ColorsApp.secondary,
            elevation: 0.0,
          ),
          iconTheme: const IconThemeData(color: ColorsApp.surface),
          fontFamily: Constants.roboto,
          useMaterial3: true),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
