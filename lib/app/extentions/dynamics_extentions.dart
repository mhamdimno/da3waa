import 'package:enum_to_string/enum_to_string.dart';
import 'package:da3wa/app/my_res.dart';

extension dynamicExtentions on dynamic {
  String get toStringEnumKey => EnumToString.convertToString(this);
  bool get is_null => this == null;

}
