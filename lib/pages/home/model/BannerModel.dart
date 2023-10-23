class BannerResponseModel {
  int? statusCode;
  String? message;
  List<Data>? data;

  BannerResponseModel({this.statusCode, this.message, this.data});

  BannerResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? urlPicture;

  Data({this.id, this.urlPicture});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlPicture = json['url_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url_picture'] = this.urlPicture;
    return data;
  }
}
