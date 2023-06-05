import 'package:firestore_model/firestore_model.dart';

class User extends FirestoreModel<User> {
  String? name;
  int? points;
  String? uuid;

  User({this.name, this.points,this.uuid});

  // use to read
  User.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.points = map['points'];
    this.uuid = map['uuid'];
  }

  // use to write
  @override
  Map<String, dynamic> get toMap => {
    'name': this.name,
    'points': this.points,
    'uuid': this.uuid,
  };

  @override
  ResponseBuilder<User> get responseBuilder => (map) => User.fromMap(map);

}