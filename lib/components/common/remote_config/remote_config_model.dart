class RemoteConfigModel {
  String? minVersion;
  bool? miantainanceMode;

  RemoteConfigModel({
    this.miantainanceMode,  this.minVersion,
  });

  factory RemoteConfigModel.fromJson(Map<String, dynamic> json) {
    return RemoteConfigModel(
      minVersion: json['min_app_version'],
      miantainanceMode: json['maintainance_mode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maintainance_mode': miantainanceMode,
      'min_app_version': minVersion,
    };
  }
}