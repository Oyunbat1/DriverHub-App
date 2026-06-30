import 'package:driverhub/pages/auth/suite/auth_pages.dart';
import 'package:driverhub/pages/history/suite/history_pages.dart';
import 'package:driverhub/pages/home/suite/home_pages.dart';
import 'package:driverhub/pages/notifications/suite/notifications_pages.dart';
import 'package:driverhub/pages/orders/suite/orders_pages.dart';
import 'package:get/get.dart';
import 'app_routes.dart';


abstract class AppPages {
  static const String initial = Routes.splash;

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    ...AuthPages.pages,
    ...HistoryPages.pages,
    ...OrdersPages.pages,
    ...NotificationsPages.pages,
    ...HomePages.pages,
  ];
}
