import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/imagepath.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Get.put(SplashController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.gradientTopColor, AppColors.gradientBottomColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    ImagePath.iknowalogo,
                    width: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.fitWidth,
                  ),
                )
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 16),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "V.0.1",
                            style: AppFonts.regular(15, AppColors.white.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))
          ],
        )
    );
  }
}
