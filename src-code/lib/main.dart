import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_export.dart';
import 'package:ahapp3/presentation/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'service/notification_service.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  //fire up the notification service
  var notificationService = NotificationService();
  await notificationService.init();
  await notificationService.requestIOSPermissions();
  notificationService.scheduleNotification(
      1,
      'test',
      'testing our notification service',
      DateTime(2024, 2, 23),
      TimeOfDay(hour: 10, minute: 0),
      'test');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const WidgetTree(),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ThemeBloc(
//         ThemeState(
//           themeType: PrefUtils().getThemeData(),
//         ),
//       ),
//       child: BlocBuilder<ThemeBloc, ThemeState>(
//         builder: (context, state) {
//           return MaterialApp(
//             theme: theme,
//             title: 'ahapp3',
//             navigatorKey: NavigatorService.navigatorKey,
//             debugShowCheckedModeBanner: false,
//             localizationsDelegates: [
//               AppLocalizationDelegate(),
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],
//             home: const WidgetTree(),
//             routes: AppRoutes.routes,
//           );
//         },
//       ),
//     );
//   }
// }


//var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Future.wait([
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//     ]),
//     PrefUtils().init()
//   ]).then((value) {
//     runApp(MyApp());
//   });
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ThemeBloc(
//         ThemeState(
//           themeType: PrefUtils().getThemeData(),
//         ),
//       ),
//       child: BlocBuilder<ThemeBloc, ThemeState>(
//         builder: (context, state) {
//           return MaterialApp(
//             theme: theme,
//             title: 'ahapp3',
//             navigatorKey: NavigatorService.navigatorKey,
//             debugShowCheckedModeBanner: false,
//             localizationsDelegates: [
//               AppLocalizationDelegate(),
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],
//             supportedLocales: [
//               Locale(
//                 'en',
//                 '',
//               ),
//             ],
//             initialRoute: AppRoutes.initialRoute,
//             routes: AppRoutes.routes,
//           );
//         },
//       ),
//     );
//   }
// }
