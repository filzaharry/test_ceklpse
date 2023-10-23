class MenuMasterResponseModel {
  int? statusCode;
  String? message;
  List<Data>? data;

  MenuMasterResponseModel({this.statusCode, this.message, this.data});

  MenuMasterResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? description;
  String? path;
  Icon? icon;

  Data({this.id, this.description, this.path, this.icon});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    path = json['path'];
    icon = json['icon'] != null ? new Icon.fromJson(json['icon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['path'] = this.path;
    if (this.icon != null) {
      data['icon'] = this.icon!.toJson();
    }
    return data;
  }
}

class Icon {
  String? active;
  String? inactive;
  String? scndImage;

  Icon({this.active, this.inactive, this.scndImage});

  Icon.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    inactive = json['inactive'];
    scndImage = json['scndImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['inactive'] = this.inactive;
    data['scndImage'] = this.scndImage;
    return data;
  }
}
