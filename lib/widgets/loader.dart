import 'package:flutter/material.dart';
import 'package:tipy_shop/utils/images.dart';
import 'package:tipy_shop/utils/size_config.dart';
import 'package:tipy_shop/utils/theme_colors.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var block = SizeConfig.block!;
    return Stack(
      children: [
        Container(
          height: block * 20,
          width: block * 20,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              height: block * 15,
              width: block * 15,
              decoration: BoxDecoration(
                color: ThemeColors.baseThemeColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    Images.appLogo,
                    height: block * 20,
                    width: block * 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          bottom: 2,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            backgroundColor: ThemeColors.baseThemeColor,
          ),
        ),
      ],
    );
  }
}
