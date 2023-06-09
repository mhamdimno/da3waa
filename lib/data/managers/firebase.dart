import 'dart:async';
import 'dart:async';

import 'package:da3wa/app/app_prefs.dart';
import 'package:firestore_model/firestore_model.dart';

import '../../domain/remote/cat.dart';
import '../../domain/remote/user.dart';

class FBManager{


  static  init() async{
    await FirebaseApp.initializeApp(

    );
    FirestoreModel.injectAll([User(),Cat()]);


  }
  static Future<bool> get isExistUser =>  FirestoreModel.use<User>().exists(AppStorage.uuid);
  static Future<User?> get user =>  FirestoreModel.use<User>().find(AppStorage.uuid);
  static Future<List<Cat?>> get cats =>  FirestoreModel.use<Cat>().all();
  static Future createUser(String v) async{
    User user = User(name: v, points: 0);
    await user.create(docId: AppStorage.uuid);
  }


  static Future increasePoints(int points)async{
   await user.then((value) {
      return  value!.increment(field: "points",value: points);
    });

}
}