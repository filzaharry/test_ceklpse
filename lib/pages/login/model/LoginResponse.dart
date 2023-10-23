class LoginResponseModel {
  String? message;
  Data? data;
  int? statusCode;
  Popup? popup;

  LoginResponseModel({this.message, this.data, this.statusCode, this.popup});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    popup = json['popup'] != null ? new Popup.fromJson(json['popup']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['statusCode'] = this.statusCode;
    if (this.popup != null) {
      data['popup'] = this.popup!.toJson();
    }
    return data;
  }
}

class Data {
  int? type;
  String? message;

  Data({this.type, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}

class Popup {
  String? title;
  String? content;
  String? icon;

  Popup({this.title, this.content, this.icon});

  Popup.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['icon'] = this.icon;
    return data;
  }
}
