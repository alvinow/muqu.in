import 'package:matrixclient2base/appconfig.dart';

class DeployAppConfig extends BaseAppConfig{
  static const String deployAppId="SIM Tindak Lanjut Audit 2024";
  DeployAppConfig(

  ):super(  generalConfig: const BaseGeneralConfig( showStartSplashScreen: false, mainLogoPath: "assets/image/muqu_box.jpeg", appVersion: "3.0.19", baseUrl:"https://dev.muqu.in", appId:"muqu", appTitle: "Muqu Indonesia", locale: "EN_en"));

  }
