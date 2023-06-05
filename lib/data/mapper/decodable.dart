import 'package:da3wa/app/enums.dart';
import 'package:da3wa/app/extentions/dynamics_extentions.dart';
import 'package:da3wa/app/my_res.dart';

typedef Create<T> = T Function();

///Construct to get object from generic class

abstract class GenericObject<T> {
  Create<Decodable?>? create;

  GenericObject({this.create});

  T genericObject(Map<String, dynamic> data) {
    final item = create!();
    return item?.decode(data);
  }
}



class ResponseWrapper<T> extends GenericObject<T> {
  T? response;
  ErrorResponse? error;

  ResponseWrapper({Create<Decodable>? create, this.error})
      : super(create: create);

  factory ResponseWrapper.init(
      {Create<Decodable>? create, Map<String, dynamic>? json}) {
    final wrapper = ResponseWrapper<T>(create: create!);
    wrapper.response = wrapper.genericObject(json!);
    return wrapper;
  }
}

enum parseType { data, user }

class APISimple<T> extends GenericObject<T> implements Decodable<APISimple<T>> {
  String? msg, key, token;

  APISimple({Create<Decodable?>? create, parseType type = parseType.data})
      : super(create: create);

  @override
  APISimple<T> decode(dynamic json) {
    msg = json[""];

    return this;
  }
}

class APIResponse<T> extends GenericObject<T>
    implements Decodable<APIResponse<T>> {
  String? msg, key;
  T? data;

  APIResponse({Create<Decodable?>? create, parseType type = parseType.data})
      : super(create: create);

  @override
  APIResponse<T> decode(dynamic json) {
    data = genericObject(json![""]);
    return this;
  }
}

class APIListResponse<T> extends GenericObject<T>
    implements Decodable<APIListResponse<T>> {
  String? status;
  List<T>? data;

  APIListResponse({Create<Decodable>? create}) : super(create: create);

  @override
  APIListResponse<T> decode(Map<String, dynamic>? json) {
    //  status = json['status'];
    if (json != null) {
      data = [];
      (json['data'] ?? json['times']).forEach((item) {
        data?.add(genericObject(item!));
      });
    }

    return this;
  }
}

class ErrorResponse implements Exception {
  String? message;

  ErrorResponse({this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
        message:
            json[""] ?? AppStrings.serverError);
  }

  @override
  String toString() {
    return message ?? "";
  }
}

abstract class Decodable<T> {
  T decode(Map<String, dynamic> data);
}

class TypeDecodable<T> implements Decodable<TypeDecodable<T>> {
  T? value;
  TypeDecodable({this.value});

  @override
  TypeDecodable<T> decode(dynamic? data) {
    value = data!;
    return this;
  }
}
