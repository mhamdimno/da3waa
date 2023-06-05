import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:da3wa/app/extentions/dynamics_extentions.dart';
import 'package:da3wa/app/extentions/strings_extentions.dart';

import 'functios.dart';

enum AppLocalKeys {
  token,
  uuid
}

class AppStorage {
  static final _box = GetStorage();

  static _read(String k) =>
    _box.read(k);

  static _remove(String k) => _box.remove(k);

  static _write(String k, dynamic v) =>
_box.write(k, v);

  static del(String k) =>
 _remove(k);

  static destroy() => _box.erase();

  //Probs

  static String? get token => _read(AppLocalKeys.token.toStringEnumKey);

  static set token(String? v) => _write(AppLocalKeys.token.toStringEnumKey, v);
  static String get uuid => _read(AppLocalKeys.uuid.toStringEnumKey) ?? "";

  static set uuid(String? v) => _write(AppLocalKeys.uuid.toStringEnumKey, v);


  static bool get is_not_login => token.isNullOrEmpty;

  static logout() {
    if (is_web) {
      AppStorage.del(AppLocalKeys.token.toStringEnumKey);
    } else {
      AppStorage.destroy();
    }
  }
}
