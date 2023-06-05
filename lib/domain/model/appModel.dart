import '../../data/mapper/decodable.dart';

class mgeneral implements Decodable<mgeneral> {
  dynamic id, tag, rate, price, image, delivery_cost, duration;

  bool? isProduction, selected, active;
  String? phone,
      token,
      name,
      email,
      password,
      cpassword,
      npassword,
      user_name,
      user_image,
      user_phone,
      title,
      time,
      value,
      avatar,
      number,
      type,
      desc,
      url,
      content,
      sub_title,
      comment,
      status,
      about_us,
      date,
      policy,
      terms;

  List<mgeneral?>? images;
  mgeneral? user;

  mgeneral({
    this.time,
    this.delivery_cost,
    this.id,
    this.tag,
    this.rate,
    this.value,
    this.isProduction,
    this.selected,
    this.active,
    this.phone,
    this.token,
    this.name,
    this.title,
    this.avatar,
    this.number,
    this.image,
    this.type,
    this.desc,
    this.sub_title,
    this.comment,
    this.about_us,
    this.date,
    this.policy,
    this.terms,
    this.user,
  });

  @override
  mgeneral decode(dynamic json) {
    id = json['id'] ?? json['user_unique_id'];
    email = json['email'];
    delivery_cost = json['delivery_cost'];
    about_us = json['about_us'];
    terms = json['terms'];
    policy = json['policy'];
    token = json['token'];
    content = json['content'];
    status = json['order_status'] ?? json['payment_status'];

    name = json['name'] ?? json['user_name'] ?? json['provider_name'];

    title = json['title'] ?? json['text'] ?? json['question'];
    phone = json['phone'] ?? json['user_phone'];
    rate = json['rate'];
    price = json['total'];

    comment = json['comment'];
    content = json['content'];

    date = json['date'];
    duration = json['duration'];

    image = json['image'];

    desc = json['contract_description'] ??
        json['description'] ??
        json['text'] ??
        json['answer'];
    active = json?['active'];
    parse_images(json, "sliders");
    parse_images(json, "contract_images");

    isProduction = json['isProduction'] ?? true;
    user_name = json['user_name'];
    user_image = json['user_image'];
    user_phone = json['user_phone'];
    user = mgeneral.fromJson(json['user']);

    return this;
  }

  parse_images(json, String v) {
    if (json[v] != null) {
      images = [];
      json[v].forEach((v) {
        images?.add(new mgeneral.fromJson(v));
      });
    }
  }

  mgeneral.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['id'];
      title = json['title'];
      token = json['token'];
      name = json['name'];
      avatar = json['avatar'];
      active = json['active'];
      image = json['image'];
      price = json['total'];
      delivery_cost = json['delivery_cost'];

      status = json['order_status'] ?? json['payment_status'];

      name = json['name'] ?? json['user_name'] ?? json['provider_name'];
      title = json['title'] ?? json['text'] ?? json['question'];
      phone = json['phone'] ?? json['user_phone'];
      rate = json['rate'];

      date = json['date'];
      duration = json['duration'];
      desc = json['contract_description'] ??
          json['description'] ??
          json['text'] ??
          json['answer'];
      user_name = json['user_name'];
      user_image = json['user_image'];
      user_phone = json['user_phone'];
      parse_images(json, "contract_images");
    }
  }
}
