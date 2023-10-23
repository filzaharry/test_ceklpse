// class FcmModal {
//   Data? data;

//   FcmModal({this.data});

//   FcmModal.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

class FcmModal {
  String? path;
  String? coupon;
  String? isValid;
  List<Content>? content;

  FcmModal({this.path, this.coupon, this.isValid, this.content});

  FcmModal.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    coupon = json['coupon'];
    isValid = json['is_valid'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['coupon'] = this.coupon;
    data['is_valid'] = this.isValid;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? text;
  String? ta;

  Content({this.text, this.ta});

  Content.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    ta = json['ta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['ta'] = this.ta;
    return data;
  }
}
