import 'package:intl/intl.dart' as tl;
import 'package:da3wa/data/managers/dateTimeManger.dart';

extension DateTimeExtentionOptional on DateTime? {
  String  toStringFromDate({String? type}) =>
      this == null ? "" : tl.DateFormat(type ?? DateTimeManger.date_default_formatter).format(this!);
}

extension DateTimeExtention on DateTime {


}
