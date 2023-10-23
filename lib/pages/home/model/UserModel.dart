class UserDataResponseModel {
  int? statusCode;
  String? message;
  Data? data;

  UserDataResponseModel({this.statusCode, this.message, this.data});

  UserDataResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Media? media;
  int? id;
  String? name;
  String? picture;
  String? hp;
  int? type;
  String? sessionId;
  bool? password;
  String? message;

  Data(
      {this.media,
      this.id,
      this.name,
      this.picture,
      this.hp,
      this.type,
      this.sessionId,
      this.password,
      this.message});

  Data.fromJson(Map<String, dynamic> json) {
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    hp = json['hp'];
    type = json['type'];
    sessionId = json['sessionId'];
    password = json['password'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['hp'] = this.hp;
    data['type'] = this.type;
    data['sessionId'] = this.sessionId;
    data['password'] = this.password;
    data['message'] = this.message;
    return data;
  }
}

class Media {
  String? name;
  int? code;
  int? id;

  Media({this.name, this.code, this.id});

  Media.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['id'] = this.id;
    return data;
  }
}
