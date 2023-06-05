import 'dart:async';
import 'dart:async';

import 'package:da3wa/app/app_prefs.dart';
import 'package:firestore_model/firestore_model.dart';

import '../../domain/remote/cat.dart';
import '../../domain/remote/user.dart';

class FBManager{


  static  init(){
    FirestoreModel.injectAll([User(),Cat()]);


  }
  static Future<bool> get isExistUser =>  FirestoreModel.use<User>().exists(AppStorage.uuid);
  static Future<User?> get user =>  FirestoreModel.use<User>().find(AppStorage.uuid);
  static Future createUser(String v) async{
    User user = User(name: v, points: 0);
    await user.create(docId: AppStorage.uuid);
  }


  static increasePoints(int points){
    user.then((value) => value!.increment(field: "points",value: points));

}
}