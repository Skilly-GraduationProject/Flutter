import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helper/bloc_observer.dart';
import 'package:grad_project/core/helper/bloc_providers.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/notifications.dart';
import 'package:grad_project/firebase_options.dart';
import 'core/helper/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setUp();
  // Bloc.observer =
  LocalNotification localNotification = LocalNotification();
  await localNotification.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: blocProviders,
        child: MaterialApp.router(
            locale: const Locale("ar"),
            localizationsDelegates: const [
              // S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale("ar"), Locale("en")],
            // supportedLocales: S.delegate.supportedLocales,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: '29LTBukra',
              scaffoldBackgroundColor: Colors.white,
            )),
      ),
    );
  }
}
