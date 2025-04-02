import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controllers/language_controller.dart';
import '../../main_develop.dart';
import '../../utils/images.dart';
import '/utils/theme_colors.dart';
import 'package:get/get.dart';

class ChangeLanguagePage extends StatefulWidget {
  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  final languageController = Get.put(LanguageController());

  var mainHeight, mainWidth;

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.baseThemeColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('CHANGE_LANGUAGE'.tr),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      languageController.changeLanguage('es', 'Spanish');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            box.read('languageCode') == 'es'
                                ? ThemeColors.baseThemeColor.withOpacity(0.08)
                                : Colors.white,
                        border:
                            box.read('languageCode') == 'es'
                                ? Border.all(color: ThemeColors.baseThemeColor)
                                : Border.all(color: Colors.white),
                      ),
                      height: 56,
                      child: Row(
                        children: [
                          SizedBox(width: 16),
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: Image.asset(
                                Images.es,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Spanish',
                            style: TextStyle(fontSize: 18, height: 0.8),
                          ),
                          const Spacer(),
                          box.read('languageCode') == 'es'
                              ? Padding(
                                padding: EdgeInsets.only(right: 18, left: 16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(
                                    FontAwesomeIcons.check,
                                    color: ThemeColors.baseThemeColor,
                                  ),
                                ),
                              )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      languageController.changeLanguage('en', 'English');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            box.read('languageCode') == 'en'
                                ? ThemeColors.baseThemeColor.withOpacity(0.08)
                                : Colors.white,
                        border:
                            box.read('languageCode') == 'en'
                                ? Border.all(color: ThemeColors.baseThemeColor)
                                : Border.all(color: Colors.white),
                      ),
                      height: 56,
                      child: Row(
                        children: [
                          SizedBox(width: 16),
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: Image.asset(
                                Images.en,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'English',
                            style: TextStyle(fontSize: 18, height: 0.8),
                          ),
                          const Spacer(),
                          box.read('languageCode') == 'en'
                              ? Padding(
                                padding: EdgeInsets.only(right: 18, left: 16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(
                                    FontAwesomeIcons.check,
                                    color: ThemeColors.baseThemeColor,
                                  ),
                                ),
                              )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
