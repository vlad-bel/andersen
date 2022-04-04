import 'package:andersen_test1/config/app_string.dart';
import 'package:andersen_test1/config/resources.dart';

enum TabItem { data, user }

extension TabsExtension on TabItem {
  String get iconPath {
    switch (this) {
      case TabItem.data:
        return Resources.listIcon;
      case TabItem.user:
        return Resources.userIcon;
    }
  }

  String get title {
    switch (this) {
      case TabItem.data:
        return AppString.data;
      case TabItem.user:
        return AppString.user;
    }
  }

  static TabItem fromIndex(int index) {
    switch (index) {
      case 0:
        return TabItem.data;
      default:
        return TabItem.user;
    }
  }
}
