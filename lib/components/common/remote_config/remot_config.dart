import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:food_funda_business/components/common/remote_config/remote_config_model.dart';

class RemoteConfig {
  static final RemoteConfig _instance = RemoteConfig._internal();
  final RemoteConfigModel _configModel = RemoteConfigModel(); 

  factory RemoteConfig() {
    return _instance;
  }

  RemoteConfig._internal();

  Future<void> fetchConfig() async {
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    _configModel.minVersion = remoteConfig.getString('min_app_version');
    _configModel.miantainanceMode = remoteConfig.getBool('maintainance_mode');
  }
 
  RemoteConfigModel get configModel => _configModel;
}
