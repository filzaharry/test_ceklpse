class UtilsModel {
  int? statusCode;
  String? message;
  Data? data;

  UtilsModel({this.statusCode, this.message, this.data});

  UtilsModel.fromJson(Map<String, dynamic> json) {
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
  String? hpCs;
  String? jamKerja;
  String? hariKerja;
  String? message;
  String? scriptRank;

  Data(
      {this.hpCs,
      this.jamKerja,
      this.hariKerja,
      this.message,
      this.scriptRank});

  Data.fromJson(Map<String, dynamic> json) {
    hpCs = json['hpCs'];
    jamKerja = json['jamKerja'];
    hariKerja = json['hariKerja'];
    message = json['message'];
    scriptRank = json['scriptRank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hpCs'] = this.hpCs;
    data['jamKerja'] = this.jamKerja;
    data['hariKerja'] = this.hariKerja;
    data['message'] = this.message;
    data['scriptRank'] = this.scriptRank;
    return data;
  }
}
