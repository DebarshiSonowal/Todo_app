import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/helper/storage.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';
import 'package:vishal_todo_app/src/services/notification_services.dart';
import 'package:vishal_todo_app/src/services/routes.dart';
import 'package:vishal_todo_app/src/theme/apptheme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  NotificationService().initNotification();
  await Storage.instance.initializeStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Repository(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return CalendarControllerProvider(
          controller: EventController(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todo App',
            theme: AppTheme.getTheme(),
            // theme: AppTheme.getTheme(),
            navigatorKey: Navigation.instance.navigatorKey,
            onGenerateRoute: generateRoute,
          ),
        );
      }),
    );
  }
}
