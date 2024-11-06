import 'package:machietaskcodexes/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:machietaskcodexes/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:machietaskcodexes/ui/views/home/home_view.dart';

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:machietaskcodexes/ui/views/login/login_view.dart';
import 'package:machietaskcodexes/ui/views/profile/profile_view.dart';
import 'package:machietaskcodexes/ui/views/productdetail/productdetail_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeScreen),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: ProductDetailScreen),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
