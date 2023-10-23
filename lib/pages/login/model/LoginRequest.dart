class LoginRequestModel {
  String? hp;
  String? password;
  String? version;
  String? imei;
  String? deviceType;
  String? language;
  String? manufacturer;
  String? model;
  String? os;
  String? osVersion;
  String? region;
  String? sdkVersion;
  double? heightdips;
  double? heightpixels;
  double? scale;
  double? widthdips;
  double? widthpixels;
  String? playerId;
  String? firebaseId;

  LoginRequestModel({
    this.hp,
    this.password,
    this.version,
    this.imei,
    this.deviceType,
    this.language,
    this.manufacturer,
    this.model,
    this.os,
    this.osVersion,
    this.region,
    this.sdkVersion,
    this.heightdips,
    this.heightpixels,
    this.scale,
    this.widthdips,
    this.widthpixels,
    this.playerId,
    this.firebaseId,
  });

  Map<String, dynamic> toJson() => {
        "hp": hp,
        "media": 500,
        "password": password,
        "version": version,
        "device": {
          "imei": imei,
          "devicetype": deviceType,
          "language": language,
          "manufacturer": manufacturer,
          "model": model,
          "os": os,
          "osVersion": osVersion,
          "region": region,
          "sdkVersion": sdkVersion,
          "heightdips": heightdips,
          "heightpixels": heightpixels,
          "scale": scale,
          "widthdips": widthdips,
          "widthpixels": widthpixels,
          "player_id": playerId,
          "firebase_id": firebaseId,
        }
      };
}
