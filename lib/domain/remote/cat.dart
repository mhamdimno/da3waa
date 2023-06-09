import 'package:firestore_model/firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cat extends FirestoreModel<Cat> {
  String? name;
  int? points;
  String? desc;

  Cat({this.name, this.points,this.desc});

  // use to read
  Cat.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.points = map['points'];
    this.desc = map['desc'];
  }

  // use to write
  @override
  Map<String, dynamic> get toMap => {
    'name': this.name,
    'points': this.points,
    'desc': this.desc,
  };

  @override
  ResponseBuilder<Cat> get responseBuilder => (map) => Cat.fromMap(map);

  List<Cat> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
      snapshot.data() as Map<String, dynamic>;

      return Cat(
          name: dataMap['name'],
          desc: dataMap['desc'],
          points: dataMap['points'],
      );
    }).toList();

}}