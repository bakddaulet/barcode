import 'package:barcode/core/global_bloc.dart';
import 'package:barcode/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


/// The Widget that configures your application.
class BarCodeApp extends StatelessWidget {
   BarCodeApp({
    super.key,
  });
  final AppRouter _appRouter = AppRouter();


  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return GlobalProvider(
      child: MaterialApp.router(
         routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
        
        restorationScopeId: 'app',
      
       
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
      
        
        
       
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
      
        
      ),
    );
  }
}
