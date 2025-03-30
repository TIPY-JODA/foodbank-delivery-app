import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tipy_shop/services/flavor_config.dart';
import 'package:tipy_shop/widgets/authentication.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'controllers/global-controller.dart';
import 'controllers/settings-controller.dart';
import 'translation/language.dart';

final box = GetStorage();
dynamic langValue = const Locale('en', null);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.prod,
    apiUrl: "https://zetainiciativa.sitepy.com/api/v1/",
  );

  await Firebase.initializeApp();
  Get.put(SettingsController()).onInit();
  await GetStorage.init();
  if (box.read('languageCode') != null) {
    langValue = Locale(box.read('languageCode'), null);
  } else {
    langValue = const Locale('en', null);
  }
  runApp(FoodEx());
}

class FoodEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Get.put(GlobalController()).onInit();
    return OverlaySupport(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: langValue,
        translations: Languages(),
        title: 'TipyShop',
        theme: ThemeData(useMaterial3: false),
        home: Authentication(),
      ),
    );
  }
}
