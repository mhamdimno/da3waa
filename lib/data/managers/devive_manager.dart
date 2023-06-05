import 'package:da3wa/app/app_prefs.dart';
import 'package:device_uuid/device_uuid.dart';

class DeviceManager{
  static init()async{
    AppStorage.uuid= await _uuid;
  }
  static Future<String?> get  _uuid=> DeviceUuid().getUUID();
}